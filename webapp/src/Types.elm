-- The MIT License (MIT)
--
-- Copyright (c) 2022 Álan Crístoffer e Sousa
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.


module Types exposing (Flags, Language(..), Model, Msg(..), Project(..), Route(..), TranslationDictionary(..), language2String, string2Language)

import Browser
import Browser.Navigation
import Element exposing (Device)
import Url


type Route
    = About
    | Projects Project
    | Publications
    | Experience


type Project
    = Lachesis
    | Moirai
    | Ahio
    | Void
    | TestsDatabase
    | Tracker
    | CEF
    | SIGAA


type Language
    = Portuguese
    | English
    | German
    | French


language2String : Language -> String
language2String lang =
    case lang of
        Portuguese ->
            "pt"

        English ->
            "en"

        German ->
            "de"

        French ->
            "fr"


string2Language : String -> Language
string2Language lang =
    case lang of
        "pt" ->
            Portuguese

        "de" ->
            German

        "fr" ->
            French

        _ ->
            English


type TranslationDictionary
    = TString String
    | TList (List String)


type alias Flags =
    { height : Int
    , width : Int
    , ratio : Int
    , lang : String
    }


type alias Model =
    { key : Browser.Navigation.Key
    , route : Route
    , url : Url.Url
    , device : Device
    , lang : Language
    , hoverOn : Route
    , showAbstract : Bool
    , fullscreenImage : Maybe String
    , flags : Flags
    }


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | SetScreenSize Int Int
    | SetLanguage Language
    | SidebarHoverStart Route
    | SidebarHoverEnd
    | SetShowAbstract Bool
    | SetFullscreenImage (Maybe String)
