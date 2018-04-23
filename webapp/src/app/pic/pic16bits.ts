// Made possible by http://www.piclist.com/techref/microchip/PIC16DelayTutorial.htm

// The MIT License (MIT)

// Copyright (c) 2014 Álan Crístoffer

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the 'Software'), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import { PIC, Exp } from './pic'

export class PIC16bits extends PIC {
  bits = 16

  // find the formula for n variables
  formula(n: number): Exp {
    const node = new Exp()
    node.name = `d${n}`

    if (n === 1) {
      return new Exp(4, '*', node)
    }

    return new Exp(new Exp(this.formula(n - 1), '+', new Exp(new Exp(4, '+', this.max(n - 1)), '*', new Exp(node, '-', 1))), '+', 4)
  }

  generateASM(inst, clk, func_name = 'delay') {
    let asm, bra, constants, consumed_instructions, i, j, k, l, m,
      need_to_consume, nop, number_of_variables, ref, ref1, ref2, ref3

    if (inst < 0) {
      return ''
    }

    if (inst < 5) {
      nop = inst % 2
      bra = (inst - nop) / 2
      asm = ''

      while (bra > 0) {
        asm += '\tbra $+2\n'
        bra -= 1
      }

      if (nop === 1) {
        asm += '\tnop\n'
      }

      return asm
    }

    if (inst < 11) {
      inst -= 5
      nop = inst % 2
      bra = (inst - nop) / 2
      asm = `${func_name}:\n`

      while (bra > 0) {
        asm += '\tbra $+2\n'
        bra -= 1
      }

      if (nop === 1) {
        asm += '\tnop\n'
      }

      asm += '\treturn\n'

      return asm
    }

    number_of_variables = Math.ceil(Math.log(inst) / Math.log(65535))
    consumed_instructions = number_of_variables * 2 + 3 + 2 // var initialization + return + call
    need_to_consume = inst - consumed_instructions
    constants = this.constantsForNVars(number_of_variables, need_to_consume)
    asm = '\t.bss\n'

    for (i = j = 1, ref = number_of_variables; j <= ref; i = j += 1) {
      asm += `d${i}: .space 2\n`
    }

    asm += '\n'
    asm += '\t.text\n'
    asm += `\t.global ${func_name}\n\n`
    asm += `${func_name}:\n`

    for (i = k = 1, ref1 = number_of_variables; k <= ref1; i = k += 1) {
      asm += `\tmov\t#${constants[i]},w0\n`
      asm += `\tmov\tw0,d${i}\n`
    }

    asm += '\n'
    asm += `${func_name}_loop:\n`

    for (i = l = 1, ref2 = number_of_variables; l <= ref2; i = l += 1) {
      asm += `\tdec \td${i}\n`
      asm += '\tbtss\tSR,#1\n'
      asm += `\tgoto\t${func_name}_loop\n`
    }

    if (constants[0] > 0) {
      asm += '\n'
    }

    while (constants[0] > 0) {
      if (constants[0] >= 2) {
        asm += '\tbra $+2\n'
        constants[0] -= 2
      } else {
        asm += '\tnop\n'
        constants[0] -= 1
      }
    }

    for (i = m = 1, ref3 = constants[0]; m <= ref3; i = m += 1) {
      asm += '\tnop\n'
    }

    asm += '\n\treturn\n'

    return asm
  }
}
