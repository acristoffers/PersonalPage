import { Component, HostListener } from '@angular/core'
import { TranslateService } from '../translation'

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  headerClass: string

  constructor(private i18n: TranslateService) {
    const lang = localStorage.getItem('language')
    if (lang) {
      i18n.use(lang)
    } else {
      i18n.use(window.navigator.language.split('-')[0])
    }
  }

  @HostListener('window:scroll', ['$event'])
  scroll(event) {
    // for Safari
    const y = document.documentElement.scrollTop || document.body.scrollTop
    this.headerClass = y > 0 ? 'shadow' : ''
  }
}
