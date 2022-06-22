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


module Sidebar exposing (view)

import Element exposing (..)
import Element.Background
import Element.Events
import Element.Font
import Html.Attributes
import Html.Events exposing (onClick)
import I18n.I18n exposing (tr)
import Simple.Transition as Transition
import Types exposing (..)


roundedCorner : Element.Attribute Msg
roundedCorner =
    Html.Attributes.class "rounded-corners-image" |> htmlAttribute


view : Model -> Element Msg
view model =
    column
        [ width fill
        , height fill
        ]
        [ row
            [ width fill
            , spacing 8
            , padding 16
            ]
            [ image
                [ width (px 125)
                , height (px 125)
                , roundedCorner
                , centerX
                ]
                { src = "/me.jpg", description = "My photo" }
            , column
                [ Element.Font.size 32
                , Element.Font.color (rgb 1 1 1)
                , alignBottom
                , centerX
                ]
                [ text "Álan "
                , text "Crístoffer"
                , el
                    [ Element.Font.bold ]
                    (text "e Sousa")
                ]
            ]
        , row
            [ width fill
            , spacing 8
            , padding 16
            ]
            [ flag model Portuguese
            , flag model English
            , flag model German
            , flag model French
            ]
        , el [ height (px 24) ] none
        , column
            [ width fill ]
            [ menuItem model About
            , menuItem model (Projects Lachesis)
            , menuItem model Publications
            , menuItem model Experience
            , bookmark model
            ]
        ]


menuItem : Model -> Route -> Element Msg
menuItem model route =
    let
        str =
            case route of
                About ->
                    "about"

                Projects _ ->
                    "projects"

                Publications ->
                    "publications"

                Experience ->
                    "experience"

        url =
            "/" ++ str

        value =
            tr model.lang str

        color =
            if model.route == route then
                rgb 0.92 0.17 0

            else
                case ( model.route, route ) of
                    ( Projects _, Projects _ ) ->
                        rgb 0.92 0.17 0

                    _ ->
                        rgb 1 1 1
    in
    link
        [ Html.Attributes.style "padding-top" "12px" |> htmlAttribute
        , Html.Attributes.style "z-index" "1" |> htmlAttribute
        , height (px 48)
        , centerX
        , Element.Font.size 24
        , Element.Font.color color
        , Element.mouseOver [ Element.Font.color (rgb 0.92 0.17 0) ]
        , Transition.properties [ Transition.color 500 [] ] |> Element.htmlAttribute
        , Element.Events.onMouseEnter (SidebarHoverStart route)
        , Element.Events.onMouseLeave SidebarHoverEnd
        ]
        { url = url
        , label = text value
        }


flag : Model -> Language -> Element Msg
flag model lang =
    let
        abbr =
            case lang of
                Portuguese ->
                    "pt"

                English ->
                    "en"

                German ->
                    "de"

                French ->
                    "fr"

        url =
            "/" ++ abbr ++ ".svg"

        desc =
            tr model.lang abbr
    in
    link
        [ onClick (SetLanguage lang) |> htmlAttribute
        , centerX
        ]
        { url = "#"
        , label =
            image
                [ width (px 32)
                , height (px 22)
                , roundedCorner
                ]
                { src = url, description = desc }
        }


bookmark : Model -> Element Msg
bookmark model =
    let
        index =
            case model.hoverOn of
                About ->
                    0

                Projects _ ->
                    1

                Publications ->
                    2

                Experience ->
                    3
    in
    row
        [ Html.Attributes.class "bookmark" |> htmlAttribute
        , Html.Attributes.style "z-index" "0" |> htmlAttribute
        , Html.Attributes.style "position" "absolute" |> htmlAttribute
        , Html.Attributes.style "top" (String.fromInt (48 * index) ++ "px") |> htmlAttribute
        , Html.Attributes.id "bookmark" |> htmlAttribute
        , Transition.properties [ Transition.property "top" 250 [] ] |> Element.htmlAttribute
        , width fill
        , height (px 48)
        ]
        [ el
            ([ ( "width", "0" )
             , ( "height", "0" )
             , ( "margin-left", "5px" )
             , ( "border-top", "1.5rem solid #fff" )
             , ( "border-bottom", "1.5rem solid #fff" )
             , ( "border-left", "1.5rem solid transparent" )
             ]
                |> List.map (\( key, value ) -> htmlAttribute (Html.Attributes.style key value))
            )
            none
        , el
            [ Element.Background.color (rgb 1 1 1)
            , height fill
            , width fill
            ]
            none
        ]
