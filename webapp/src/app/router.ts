/**
 * Copyright (C) Álan Crístoffer - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Álan Crístoffer <acristoffers@gmail.com>, April 2018
 */

import { RouterModule } from '@angular/router'
import { ModuleWithProviders } from '@angular/core'
import { HomeComponent } from './home/home.component'

export class Router {
    static module(): ModuleWithProviders {
        return RouterModule.forRoot([
            {
                path: '',
                redirectTo: 'home',
                pathMatch: 'full'
            },
            {
                path: 'home',
                component: HomeComponent
            }
        ])
    }
}
