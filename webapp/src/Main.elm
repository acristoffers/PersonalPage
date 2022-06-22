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


module Main exposing (main)

import Browser
import Browser.Events
import Browser.Navigation
import Element exposing (..)
import Element.Background
import Element.Font
import Html exposing (a)
import Html.Attributes
import Layout
import Routing exposing (..)
import Types exposing (..)
import Url
import Url.Parser exposing ((</>), Parser, s)


init : Flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key
        (Maybe.withDefault About (Url.Parser.parse routeParser url))
        url
        (classifyDevice
            { height = flags.height
            , width = flags.width
            }
        )
        English
        (Maybe.withDefault About (Url.Parser.parse routeParser url))
        True
        Nothing
    , Cmd.none
    )


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = Layout.view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch [ Browser.Events.onResize (\values -> SetScreenSize values) ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Browser.Navigation.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Browser.Navigation.load href )

        UrlChanged url ->
            ( { model
                | route = Maybe.withDefault About (Url.Parser.parse routeParser url)
                , hoverOn = Maybe.withDefault About (Url.Parser.parse routeParser url)
                , showAbstract = True
                , fullscreenImage = Nothing
              }
            , Cmd.none
            )

        SetScreenSize x y ->
            let
                classifiedDevice =
                    classifyDevice
                        { width = x
                        , height = y
                        }
            in
            ( { model | device = classifiedDevice }, Cmd.none )

        SetLanguage lang ->
            ( { model | lang = lang }, Cmd.none )

        SidebarHoverStart route ->
            ( { model | hoverOn = route }, Cmd.none )

        SidebarHoverEnd ->
            ( { model | hoverOn = model.route }, Cmd.none )

        SetShowAbstract value ->
            ( { model | showAbstract = value }, Cmd.none )

        SetFullscreenImage value ->
            ( { model | fullscreenImage = value }, Cmd.none )
