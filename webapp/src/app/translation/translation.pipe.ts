/**
 * Copyright (C) Álan Crístoffer - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Álan Crístoffer <acristoffers@gmail.com>, April 2018
 */

import { Pipe, PipeTransform } from '@angular/core'
import { TranslateService } from './translation.service'

@Pipe({
    name: 'translate',
    pure: false
})
export class TranslatePipe implements PipeTransform {
    constructor(private _translate: TranslateService) { }

    transform(value: string, args: any[]): string {
        return value != null ? this._translate.instant(value) : null
    }
}
