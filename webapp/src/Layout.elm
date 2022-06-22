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
import Browser.Navigation
import Element exposing (..)
import Element.Background
import Element.Events exposing (onClick)
import Element.Font
import Experience
import Html exposing (Html)
import Html.Attributes
import Projects
import Publications
import Sidebar
import Types exposing (..)
import Url
import Url.Parser exposing ((</>), Parser, s)


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
    layout
        [ padding 16
        , width fill
        , height fill
        , Element.Font.size 24
        , Element.Font.family
            [ Element.Font.external
                { url = "https://fonts.googleapis.com/css?family=Times New Roman"
                , name = "Times New Roman"
                }
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


desktopLayout : Model -> Html Msg
desktopLayout model =
    layout
        [ Element.Font.color (rgb 0 0 0)
        , Element.Font.size 14
        , Element.Font.family
            [ Element.Font.external
                { url = "https://fonts.googleapis.com/css?family=Times New Roman"
                , name = "Times New Roman"
                }
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
                    [ Element.Background.image "/bg.jpg"
                    , width (px 300)
                    , height fill
                    , Html.Attributes.style "background-position" "" |> htmlAttribute
                    , Html.Attributes.style "background-origin" "" |> htmlAttribute
                    , Html.Attributes.style "background-clip" "" |> htmlAttribute
                    , Html.Attributes.style "background-attachment" "" |> htmlAttribute
                    , Html.Attributes.style "background-color" "#007acc" |> htmlAttribute
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

                            Projects project ->
                                Projects.view model project

                            Publications ->
                                Publications.view model

                            Experience ->
                                Experience.view model
                        ]
                    )
                ]
            , row
                [ Element.Background.color (rgb 0 0 0)
                , Element.Font.color (rgb 1 1 1)
                , Element.Font.alignRight
                , width fill
                , height (px 32)
                ]
                [ el [ alignRight, padding 8 ] (text "© Copyright 2022 Álan Crístoffer e Sousa") ]
            ]
        )


mobileLayout : Model -> Html Msg
mobileLayout model =
    layout
        [ Element.Font.color (rgb 0 0 0)
        , Element.Font.size 14
        , Element.Font.family
            [ Element.Font.external
                { url = "https://fonts.googleapis.com/css?family=Times New Roman"
                , name = "Times New Roman"
                }
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
                    [ Element.Background.image "/bg.jpg"
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

                        Projects project ->
                            Projects.view model project

                        Publications ->
                            Publications.view model

                        Experience ->
                            Experience.view model
                    ]
                ]
            , row
                [ Element.Background.color (rgb 0 0 0)
                , Element.Font.color (rgb 1 1 1)
                , Element.Font.alignRight
                , width fill
                , height (px 32)
                ]
                [ el [ alignRight, padding 8 ] (text "© Copyright 2022 Álan Crístoffer e Sousa") ]
            ]
        )
