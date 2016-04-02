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

class @PIC8bits extends PIC
    bits: 8

    clock: (external_clock) ->
      external_clock / 4

    # find the formula for n variables
    formula: (n) ->
        node = new Exp()
        node.name = "d#{n}"
        return new Exp(-1, '+', new Exp(3, '*', node)) if n is 1
        new Exp( new Exp( @formula(n-1), '+', 2 ), '+', new Exp( new Exp( @max(n-1), '+', 3 ), '*', new Exp( node, '-', 1 ) ) )

    generateASM: (inst, clk, func_name) ->
        if inst < 0
            return ''

        if inst < 4
            nop  = inst % 2
            goto = (inst - nop) / 2

            asm  = ""
            while goto > 0
                asm += "\tgoto $+1\n"
                goto -= 1

            asm += "\tnop\n" if nop == 1
            asm += "\treturn\n"

            return asm

        if inst < 11
            inst -= 4
            nop   = (inst % 2)
            goto  = (inst - nop) / 2

            asm = "#{func_name}:\n"
            while goto > 0
                asm  += "\tgoto $+1\n"
                goto -= 1

            asm += "\tnop\n" if nop == 1
            asm += "\treturn\n"

            return asm

        number_of_variables   = Math.ceil( Math.log(inst) / Math.log(255) )
        consumed_instructions = number_of_variables * 2 + 2 + 2 # var initialization + return + call
        need_to_consume       = inst - consumed_instructions
        constants             = @constantsForNVars(number_of_variables, need_to_consume)

        asm = '\tcblock 0x20\n'
        for i in [1..number_of_variables] by 1
            asm += "\t\td#{i}\n"
        asm += '\tendc\n\n'

        asm += "#{func_name}:\n"

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
        return asm
