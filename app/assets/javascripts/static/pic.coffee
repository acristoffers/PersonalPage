#
# Made possible by http://www.piclist.com/techref/microchip/PIC16DelayTutorial.htm
#
# The MIT License (MIT)
#
# Copyright (c) 2014 Álan Crístoffer
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

class @Exp
    l: 0
    r: 0
    o: '+'
    constructor: (@l, @o, @r) ->

    evaluate: ->
        @l = @l.evaluate() if @l?.evaluate?
        @r = @r.evaluate() if @r?.evaluate?
        switch @o
            when '+' then @l + @r
            when '-' then @l - @r
            when '*' then @l * @r
            when '/' then @l / @r
            when '^' then @l ** @r
            when '%' then @l %% @r
            else undefined

    print: ->
        return @name if @name?
        pl = if @l.print? then @l.print() else @l
        pr = if @r.print? then @r.print() else @r
        "(#{pl}#{@o}#{pr})"

    replaceNode: (nodeName, value) ->
        return value if @name? and @name == nodeName
        @l = @l.replaceNode(nodeName, value) if @l instanceof Exp
        @r = @r.replaceNode(nodeName, value) if @r instanceof Exp
        this

class @PIC
    # return the max value that the n'th iteration can count to
    max: (n) ->
        f = @formula(n)
        for i in [1..n] by 1
            f = f.replaceNode("d#{i}", 2 ** @bits)
        f.evaluate()

    # find the constant multiplying the variable
    constantBeforeVariable: (j,n,exp,c) ->
        for i in [1..n] by 1
            exp.replaceNode("d#{i}", 0) unless i == j
        exp.replaceNode("d#{j}", 1)
        new Exp(exp, '-', c).evaluate()

    # find the constants we need to use in the assembly code for the specified delay
    constantsForNVars: (n,c) ->
        # find the formula for n variables
        exp = @formula(n)

        #find the constant part of the formula
        for i in [1..n] by 1
            exp.replaceNode("d#{i}", 0)
        constant = exp.evaluate()

        # find the constants that multiply each variable
        multipliers = []
        for i in [1..n] by 1
            exp = @formula(n)
            multipliers[i] = @constantBeforeVariable(i, n, exp, constant);

        # find the variable values
        constant = c - constant;
        variables = []
        for i in [n..1] by -1
            m = multipliers[i]
            rest = constant % m;
            variables[i] = (constant-rest) / m
            constant = rest

        variables[0] = constant
        variables

@getClk = (pic)->
    clk = $('#clock').val()
    clk = parseInt(clk)
    if isNaN(clk) then undefined else clk

window.register = ->
    $('#gen-inst').click ->
        $('#value').val( Math.round( $('#value').val() ) )
        $('#value').attr('step', 1)

    $('#gen-secs').click ->
        $('#value').attr('step', 0.001)

    $('#gen-freq').click ->
        $('#value').attr('step', 0.001)

    $('#generate').click ->
        v  = $('#value').val()
        f = parseFloat(v)
        i = parseInt(v)

        pic = undefined

        if $('#pic8bits').is(':checked')
            pic = new PIC8bits
        else if $('#pic16bits').is(':checked')
            pic = new PIC16bits

        clk = getClk(pic)
        return unless clk?

        inst = 0

        inst = Math.ceil( clk / f ) if $('#gen-freq').is(':checked')
        inst = Math.ceil( clk * f ) if $('#gen-secs').is(':checked')
        inst = i if $('#gen-inst').is(':checked')

        func_name = $('#label').val()

        asm = pic.generateASM(inst, clk, func_name)
        $('#asm').html(asm.replace(/\n/g, '<br>').replace(/\t/g, '&nbsp;&nbsp;&nbsp;&nbsp;'))

$ ->
    register();
    $("#content").change ->
        register()
