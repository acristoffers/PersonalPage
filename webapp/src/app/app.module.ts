/**
 * Copyright (C) Álan Crístoffer - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Álan Crístoffer <acristoffers@gmail.com>, April 2018
 */

import { BrowserModule } from '@angular/platform-browser'
import { NgModule } from '@angular/core'
import { BrowserAnimationsModule } from '@angular/platform-browser/animations'

import { AppComponent } from './app/app.component'
import { CommonModule } from '@angular/common'
import { HttpClientModule } from '@angular/common/http'
import { FormsModule, ReactiveFormsModule } from '@angular/forms'

import { Router } from './router'
import { TRANSLATION_PROVIDERS, TranslatePipe, TranslateService } from './translation'
import { HomeComponent } from './home/home.component'
import { LanguagesComponent } from './languages/languages.component'
import { AboutMeComponent } from './about-me/about-me.component'
import { ProjectsComponent } from './projects/projects.component'

@NgModule({
    declarations: [
        AppComponent,
        TranslatePipe,
        HomeComponent,
        LanguagesComponent,
        AboutMeComponent,
        ProjectsComponent,
    ],
    imports: [
        CommonModule,
        BrowserModule,
        BrowserAnimationsModule,
        HttpClientModule,
        FormsModule,
        ReactiveFormsModule,
        Router.module()
    ],
    providers: [
        TRANSLATION_PROVIDERS,
        TranslateService
    ],
    entryComponents: [],
    bootstrap: [AppComponent]
})
export class AppModule { }
