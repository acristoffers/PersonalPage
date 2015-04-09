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

class Exp
    l: 0
    r: 0
    o: '+'
    constructor: (@l, @o, @r) ->
        
    evaluate: ->
        if @l.evaluate? then @l = @l.evaluate()
        if @r.evaluate? then @r = @r.evaluate()
        switch @o
            when '+' then @l + @r
            when '-' then @l - @r
            when '*' then @l * @r
            when '/' then @l / @r
            when '^' then @l ** @r
            when '%' then @l %% @r
            else undefined
    
    print: ->
        if @name? then return @name
        pl = if @l.print? then @l.print() else @l
        pr = if @r.print? then @r.print() else @r
        return "(#{pl}#{@o}#{pr})"

replaceNode = (tree, nodeName, value) ->
    if tree?.name? and tree.name is nodeName then return value
    if tree?.l? then tree.l = replaceNode(tree.l, nodeName, value)
    if tree?.r? then tree.r = replaceNode(tree.r, nodeName, value)
    tree

# return the max value that the n'th iteration can count to
max = (n) ->
    if n is 1 then return 3 * 256 - 1
    f = formula(n)
    for i in [1..n] by 1
        f = replaceNode(f, "d#{i}", 256)
    f.evaluate()

# find the formula for n variables
formula = (n) ->
    node = new Exp()
    node.name =  "d#{n}"
    if n is 1 then return new Exp(-1, '+', new Exp(3, '*', node))
    new Exp( new Exp( formula(n-1), '+', 2 ), '+', new Exp( new Exp( max(n-1), '+', 3 ), '*', new Exp( node, '-', 1 ) ) )

# find the constant multiplying the variable
constantBeforeVariable = (j,n,exp,c) ->
    for i in [1..n] by 1
        if i isnt j then replaceNode(exp, "d#{i}", 0)
    replaceNode(exp, "d#{j}", 1)
    new Exp(exp, '-', c).evaluate()

# find the constants we need to use in the assembly code for the specified delay
constantsForNVars = (n,c) ->
    # find the formula for n variables
    exp = formula(n)
    
    #find the constant part of the formula
    for i in [1..n] by 1
        replaceNode(exp, "d#{i}", 0)
    constant = exp.evaluate()
    
    # find the constants that multiply each variable
    multipliers = []
    for i in [1..n] by 1
        exp = formula(n)
        multipliers[i] = constantBeforeVariable(i, n, exp, constant);
    
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

getClk = ->
    clk = $('#clock').val()
    clk = parseInt(clk)
    if isNaN(clk) then undefined else clk / 4

generateASM = (inst) ->
    clk = getClk()
    return undefined unless clk?
    
    number_of_variables   = Math.ceil( Math.log(inst) / Math.log(255) )
    consumed_instructions = number_of_variables * 2 + 2 + 2 # var initialization + return + call
    need_to_consume       = inst - consumed_instructions
    constants             = constantsForNVars(number_of_variables, need_to_consume)
    func_name             = $('#label').val() + '_' + inst
    asm                   = "#{func_name}:\n\t"
    
    asm += 'cblock 0x20\n'
    for i in [1..number_of_variables] by 1
        asm += "\t\td#{i}\n"
    asm += '\tendc\n\n'
    
    for i in [1..number_of_variables] by 1
        asm += "\tmovlw\t.#{constants[i]}\n"
        asm += "\tmovwf\td#{i}\n"
    asm += '\n'
    
    asm += "#{func_name}_loop:\n"
    for i in [1..number_of_variables] by 1
        asm += "\tdecfsz\td#{i},f\n"
        asm += "\tgoto\t#{func_name}_loop\n"
    
    asm += '\n' if constants[0] > 0
    
    while constants[0] > 0
        if (constants[0] >= 2 )
            asm += '\tgoto $+1\n'
            constants[0] -= 2
        else
            asm += '\tnop\n'
            constants[0] -= 1
    
    for i in [1..constants[0]] by 1
        asm += '\tnop\n'
    
    asm += '\n\treturn\n'
    $('#asm').html(asm.replace(/\n/g, '<br>').replace(/\t/g, '&nbsp;&nbsp;&nbsp;&nbsp;'))

window.register = ->
    $('#gen-freq').click ->
        freq = $('#value').val()
        freq = parseFloat(freq)
        clk = getClk()
        return unless clk?
        generateASM( Math.ceil( clk / freq ) )
    
    $('#gen-secs').click ->
        time = $('#value').val()
        time = parseFloat(time)
        clk = getClk()
        return unless clk?
        generateASM( Math.ceil( clk * time / 1000 ) )
    
    $('#gen-inst').click ->
        cycles = $('#value').val()
        cycles = parseInt cycles
        generateASM(cycles)

$ ->
    register();
    $("#content").change ->
        register()
