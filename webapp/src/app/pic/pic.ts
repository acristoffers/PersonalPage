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

const modulo = function (a: number, b: number): number {
  return (+a % (b = +b) + b) % b
}

export class Exp {
  name: string

  constructor(private l: Exp | number = 0, private o: string = '', private r: Exp | number = 0) {
  }

  evaluate() {
    if (this.l instanceof Exp) {
      this.l = this.l.evaluate()
    }

    if (this.r instanceof Exp) {
      this.r = this.r.evaluate()
    }

    switch (this.o) {
      case '+':
        return (this.l as number) + (this.r as number)
      case '-':
        return (this.l as number) - (this.r as number)
      case '*':
        return (this.l as number) * (this.r as number)
      case '/':
        return (this.l as number) / (this.r as number)
      case '^':
        return Math.pow(this.l as number, this.r as number)
      case '%':
        return modulo(this.l as number, this.r as number)
      default:
        return void 0
    }
  }

  print(): string {
    if (this.name != null) {
      return this.name
    }

    if (this.l instanceof Exp) {
      this.l = this.l.evaluate()
    }

    if (this.r instanceof Exp) {
      this.r = this.r.evaluate()
    }

    const pl = (this.l instanceof Exp) ? this.l.print() : this.l
    const pr = (this.r instanceof Exp) ? this.r.print() : this.r

    return `(${pl}${this.o}${pr})`
  }

  replaceNode(nodeName: string, value: number | Exp): number | Exp {
    if ((this.name != null) && this.name === nodeName) {
      return value
    }

    if (this.l instanceof Exp) {
      this.l = this.l.replaceNode(nodeName, value)
    }

    if (this.r instanceof Exp) {
      this.r = this.r.replaceNode(nodeName, value)
    }

    return this
  }
}

export abstract class PIC {
  // return the max value that the n'th iteration can count to
  bits: number

  abstract formula(n: number): Exp
  abstract generateASM(inst: number, clk: number, label: string): string

  max(n: number): number {
    let f = this.formula(n)
    let i: number, k: number, ref: number

    for (i = k = 1, ref = n; k <= ref; i = k += 1) {
      f = f.replaceNode(`d${i}`, Math.pow(2, this.bits)) as Exp
    }

    return f.evaluate()
  }

  // find the constant multiplying the variable
  constantBeforeVariable(j: number, n: number, exp: Exp, c: number): Exp {
    let i, k, ref

    for (i = k = 1, ref = n; k <= ref; i = k += 1) {
      if (i !== j) {
        exp.replaceNode(`d${i}`, 0)
      }
    }

    exp.replaceNode(`d${j}`, 1)

    return new Exp(exp, '-', c).evaluate()
  }

  // find the constants we need to use in the assembly code for the specified delay
  constantsForNVars(n: number, c: number): string[] {
    let constant, exp, i, k, l, m, multipliers, o, ref, ref1, ref2, rest, variables

    // find the formula for n variables
    exp = this.formula(n)

    // find the constant part of the formula
    for (i = k = 1, ref = n; k <= ref; i = k += 1) {
      exp.replaceNode(`d${i}`, 0)
    }

    constant = exp.evaluate()
    // find the constants that multiply each variable
    multipliers = []

    for (i = l = 1, ref1 = n; l <= ref1; i = l += 1) {
      exp = this.formula(n)
      multipliers[i] = this.constantBeforeVariable(i, n, exp, constant)
    }

    constant = c - constant
    variables = []

    for (i = o = ref2 = n; o >= 1; i = o += -1) {
      m = multipliers[i]
      rest = constant % m
      variables[i] = (constant - rest) / m
      constant = rest
    }

    variables[0] = constant

    return variables
  }
}
