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


module Layout exposing (view)

import About
import Browser
import Element exposing (..)
import Element.Background
import Element.Events exposing (onClick)
import Element.Font
import Experience
import Html exposing (Html)
import Html.Attributes
import Projects
import Publications
import Shortcut
import Sidebar
import Types exposing (..)
import Url


view : Model -> Browser.Document Msg
view model =
    { title = "Álan Crístoffer e Sousa"
    , body =
        [ case ( model.fullscreenImage, model.device.class ) of
            ( Nothing, Phone ) ->
                mobileLayout model

            ( Nothing, _ ) ->
                desktopLayout model

            ( Just src, _ ) ->
                fullscreenImage src
        ]
    }


fullscreenImage : String -> Html Msg
fullscreenImage src =
    Shortcut.shortcutElement [ Shortcut.esc <| SetFullscreenImage Nothing ]
        []
        [ layout
            [ padding 16
            , width fill
            , height fill
            , Html.Attributes.class "font2rem" |> htmlAttribute
            , Html.Attributes.style "color" "white" |> htmlAttribute
            , Element.Font.family
                [ Element.Font.typeface "Noto Serif"
                , Element.Font.serif
                ]
            ]
            (column [ width fill, height fill ]
                [ paragraph
                    [ height (px 48)
                    , alignRight
                    , Html.Attributes.style "text-align" "right" |> htmlAttribute
                    ]
                    [ el
                        [ Html.Attributes.style "cursor" "pointer" |> htmlAttribute
                        , onClick (SetFullscreenImage Nothing)
                        ]
                        (text "X")
                    ]
                , image
                    [ centerX
                    , Html.Attributes.style "max-height" "90%" |> htmlAttribute
                    , Html.Attributes.style "max-width" "90%" |> htmlAttribute
                    , Html.Attributes.class "fullscreen-image" |> htmlAttribute
                    ]
                    { src = src, description = "Fullscreen Screenshot" }
                ]
            )
        ]


stringToUrl : Model -> String -> Url.Url
stringToUrl model path =
    let
        url : Url.Url
        url =
            model.url
    in
    { url | path = path }


linkClicked : Model -> String -> Msg
linkClicked model url =
    LinkClicked (Browser.Internal (stringToUrl model url))


desktopLayout : Model -> Html Msg
desktopLayout model =
    Shortcut.shortcutElement
        [ Shortcut.simpleShortcut (Shortcut.Regular "-") (SetShowAbstract (not model.showAbstract))
        , Shortcut.simpleShortcut (Shortcut.Regular "1") (SetLanguage Portuguese)
        , Shortcut.simpleShortcut (Shortcut.Regular "2") (SetLanguage English)
        , Shortcut.simpleShortcut (Shortcut.Regular "3") (SetLanguage German)
        , Shortcut.simpleShortcut (Shortcut.Regular "4") (SetLanguage French)
        , Shortcut.simpleShortcut (Shortcut.Regular "a") (linkClicked model "/about")
        , Shortcut.simpleShortcut (Shortcut.Regular "s") (linkClicked model "/projects")
        , Shortcut.simpleShortcut (Shortcut.Regular "d") (linkClicked model "/publications")
        , Shortcut.simpleShortcut (Shortcut.Regular "f") (linkClicked model "/experience")
        , Shortcut.simpleShortcut (Shortcut.Regular "q") (linkClicked model "/projects/lachesis")
        , Shortcut.simpleShortcut (Shortcut.Regular "w") (linkClicked model "/projects/moirai")
        , Shortcut.simpleShortcut (Shortcut.Regular "e") (linkClicked model "/projects/ahio")
        , Shortcut.simpleShortcut (Shortcut.Regular "r") (linkClicked model "/projects/void")
        , Shortcut.simpleShortcut (Shortcut.Regular "t") (linkClicked model "/projects/tests-database")
        , Shortcut.simpleShortcut (Shortcut.Regular "y") (linkClicked model "/projects/tracker")
        , Shortcut.simpleShortcut (Shortcut.Regular "u") (linkClicked model "/projects/cef")
        , Shortcut.simpleShortcut (Shortcut.Regular "i") (linkClicked model "/projects/sigaa:notas")
        ]
        []
        [ layout
            [ Html.Attributes.style "color" "var(--foreground-color)" |> htmlAttribute
            , Html.Attributes.class "font1rem" |> htmlAttribute
            , Element.Font.family
                [ Element.Font.typeface "Noto Serif"
                , Element.Font.serif
                ]
            ]
            (column
                [ width fill
                , height fill
                ]
                [ row
                    [ width fill
                    , height fill
                    , Html.Attributes.style "overflow" "auto" |> htmlAttribute
                    ]
                    [ column
                        [ width (px 300)
                        , height fill
                        , Html.Attributes.style "background-color" "var(--bg-accent-color)" |> htmlAttribute
                        ]
                        [ Sidebar.view model ]
                    , el
                        [ Html.Attributes.style "overflow" "auto" |> htmlAttribute
                        , width fill
                        , height fill
                        ]
                        (column
                            [ width (fill |> maximum 1200)
                            , height fill
                            , centerX
                            , padding 16
                            ]
                            [ case model.route of
                                About ->
                                    About.view model

                                Projects _ ->
                                    Projects.view model

                                Publications ->
                                    Publications.view model

                                Experience ->
                                    Experience.view model
                            ]
                        )
                    ]
                , row
                    [ Element.Background.color (rgb255 33 34 44)
                    , Html.Attributes.style "color" "var(--foreground-color)" |> htmlAttribute
                    , Element.Font.alignRight
                    , Html.Attributes.class "font07rem" |> htmlAttribute
                    , Html.Attributes.style "height" "2rem" |> htmlAttribute
                    , width fill
                    ]
                    [ el [ alignRight, padding 8 ] (text "© Copyright 2022 Álan Crístoffer e Sousa") ]
                ]
            )
        ]


mobileLayout : Model -> Html Msg
mobileLayout model =
    layout
        [ Html.Attributes.style "color" "var(--foreground-color)" |> htmlAttribute
        , Html.Attributes.class "font1rem" |> htmlAttribute
        , Element.Font.family
            [ Element.Font.typeface "Noto Serif"
            , Element.Font.serif
            ]
        ]
        (column
            [ width fill
            , height fill
            ]
            [ column
                [ width fill
                , height fill
                ]
                [ column
                    [ Html.Attributes.style "background-color" "var(--bg-accent-color)" |> htmlAttribute
                    , width fill
                    ]
                    [ Sidebar.view model
                    , el [ height (px 16) ] none
                    ]
                , column
                    [ width (fill |> maximum 1200)
                    , height fill
                    , centerX
                    , padding 16
                    ]
                    [ case model.route of
                        About ->
                            About.view model

                        Projects _ ->
                            Projects.view model

                        Publications ->
                            Publications.view model

                        Experience ->
                            Experience.view model
                    ]
                ]
            , row
                [ Element.Background.color (rgb255 33 34 44)
                , Html.Attributes.style "color" "var(--foreground-color)" |> htmlAttribute
                , Element.Font.alignRight
                , Html.Attributes.class "font07rem" |> htmlAttribute
                , Html.Attributes.style "height" "2rem" |> htmlAttribute
                , width fill
                ]
                [ el [ alignRight, padding 8 ] (text "© Copyright 2022 Álan Crístoffer e Sousa") ]
            ]
        )
