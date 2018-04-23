/**
 * Copyright (C) Álan Crístoffer - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Álan Crístoffer <acristoffers@gmail.com>, April 2018
 */

import { InjectionToken } from '@angular/core'

import { LANG_DE_NAME, LANG_DE_TRANS } from './de'
import { LANG_FR_NAME, LANG_FR_TRANS } from './fr'
import { LANG_PT_NAME, LANG_PT_TRANS } from './pt'
import { LANG_EN_NAME, LANG_EN_TRANS } from './en'

export const TRANSLATIONS = new InjectionToken('translations')

export class Dictionary {
    private dictionary = {
        [LANG_DE_NAME]: LANG_DE_TRANS,
        [LANG_FR_NAME]: LANG_FR_TRANS,
        [LANG_PT_NAME]: LANG_PT_TRANS,
        [LANG_EN_NAME]: LANG_EN_TRANS
    }

    get(language: string) {
        return this.dictionary[language]
    }
}

export const TRANSLATION_PROVIDERS = [
    { provide: TRANSLATIONS, useClass: Dictionary },
]
