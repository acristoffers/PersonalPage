/**
 * Copyright (C) Álan Crístoffer - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Álan Crístoffer <acristoffers@gmail.com>, April 2018
 */

import * as _ from 'lodash'
import { Injectable, Inject } from '@angular/core'
import { TRANSLATIONS } from './translation'

@Injectable()
export class TranslateService {
    private _currentLang: string

    public get currentLang(): string {
        return this._currentLang
    }

    constructor(@Inject(TRANSLATIONS) private _translations: any) {
    }

    public use(lang: string): void {
        this._currentLang = lang
        window.localStorage.setItem('language', lang)
    }

    private translate(key: string): string {
        const lang = this._translations.get(this.currentLang) || {}
        return lang[key] || key
        // const translation = lang[key] || key
        // if (!_.has(lang, key)) {
        //     console.log(`No translation for ${key} in ${this.currentLang}`)
        // }
        // return translation
    }

    public instant(key: string): string {
        return this.translate(key)
    }
}
