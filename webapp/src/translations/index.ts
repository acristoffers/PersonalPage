import * as _ from 'lodash'

import { LANG_PT_TRANS } from './pt'
import { LANG_EN_TRANS } from './en';
import { LANG_DE_TRANS } from './de';
import { LANG_FR_TRANS } from './fr'

const ts: any = {
    en: LANG_EN_TRANS,
    de: LANG_DE_TRANS,
    fr: LANG_FR_TRANS,
    pt: LANG_PT_TRANS
}

class Translation {
    private lang: string = 'en'

    constructor() {
        const lang = localStorage.getItem('language')
        if (lang) {
            this.setLanguage(lang)
        } else {
            this.setLanguage(window.navigator.language.split('-')[0])
        }
    }

    languages(): string[] {
        return _.keys(ts)
    }

    language(): string {
        return this.lang
    }

    setLanguage(lang: string) {
        if (_.includes(this.languages(), lang)) {
            this.lang = lang
            window.localStorage.setItem('language', lang)
        }
    }

    translate(key: string): string {
        const lang = ts[this.lang] || {}
        return lang[key] || key
    }
}

export let i18n = new Translation()