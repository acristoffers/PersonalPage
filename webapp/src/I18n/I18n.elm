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


module I18n.I18n exposing (tr, trList)

import Dict exposing (Dict)
import I18n.English
import I18n.French
import I18n.German
import I18n.Portuguese
import Types exposing (..)


translations : Language -> Dict String TranslationDictionary
translations lang =
    case lang of
        Portuguese ->
            I18n.Portuguese.translations

        English ->
            I18n.English.translations

        French ->
            I18n.French.translations

        German ->
            I18n.German.translations


tr : Language -> String -> String
tr lang key =
    case Dict.get key (translations lang) of
        Just value ->
            case value of
                TString str ->
                    str

                TList _ ->
                    "WrongValueTypeForKey"

        Nothing ->
            case Dict.get key (translations English) of
                Just value ->
                    case value of
                        TString str ->
                            str

                        TList _ ->
                            "WrongValueTypeForKey"

                Nothing ->
                    key


trList : Language -> String -> List String
trList lang key =
    case Dict.get key (translations lang) of
        Just value ->
            case value of
                TList list ->
                    list

                TString _ ->
                    [ "WrongValueTypeForKey" ]

        Nothing ->
            case Dict.get key (translations English) of
                Just value ->
                    case value of
                        TList list ->
                            list

                        TString _ ->
                            [ "WrongValueTypeForKey" ]

                Nothing ->
                    [ key ]
