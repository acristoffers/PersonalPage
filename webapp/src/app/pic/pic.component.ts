import { Component } from '@angular/core'
import { PIC } from './pic'
import { PIC8bits } from './pic8bits'
import { PIC16bits } from './pic16bits'

@Component({
  selector: 'app-pic',
  templateUrl: './pic.component.html',
  styleUrls: ['./pic.component.scss']
})
export class PicComponent {
  asmHtml: string
  label = '_delay'
  clock = 4000000
  value = 1
  type = 'frequency'
  types = ['frequency', 'seconds', 'instructions']
  uc = 'pic8bits'
  ucs = ['pic8bits', 'pic16bits']

  generate(): void {
    let pic: PIC
    if (this.uc === 'pic8bits') {
      pic = new PIC8bits
    } else {
      pic = new PIC16bits
    }

    let inst = 0
    if (this.type === 'frequency') {
      inst = Math.ceil(this.clock / this.value)
    } else if (this.type === 'seconds') {
      inst = Math.ceil(this.clock * this.value)
    } else {
      inst = this.value
    }

    const asm = pic.generateASM(inst, this.clock, this.label)
    const html = asm.replace(/\n/g, '<br>').replace(/\t/g, '&nbsp;&nbsp;&nbsp;&nbsp;')
    this.asmHtml = html
  }
}
