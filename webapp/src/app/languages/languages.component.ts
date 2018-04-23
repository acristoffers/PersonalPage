import { Component, OnInit } from '@angular/core'
import { TranslateService } from '../translation/translation.service'

@Component({
  selector: 'app-languages',
  templateUrl: './languages.component.html',
  styleUrls: ['./languages.component.scss']
})
export class LanguagesComponent implements OnInit {

  constructor(private i18n: TranslateService) {
  }

  ngOnInit() {
  }

  setLanguage(lang: string): void {
    this.i18n.use(lang)
  }
}
