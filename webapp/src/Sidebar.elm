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
import Element.Events
import Element.Font
import Html
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
                , Html.Attributes.style "color" "var(--foreground-color)" |> htmlAttribute
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
        str : String
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

        url : String
        url =
            "/" ++ str

        value : String
        value =
            tr model.lang str

        color : String
        color =
            if model.route == route then
                "sidebar-item-accent"

            else
                case ( model.route, route ) of
                    ( Projects _, Projects _ ) ->
                        "sidebar-item-accent"

                    _ ->
                        "sidebar-item-foreground"
    in
    link
        [ Html.Attributes.class "sidebar-item" |> htmlAttribute
        , centerX
        , Html.Attributes.class color |> htmlAttribute
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
        abbr : String
        abbr =
            language2String lang

        url : String
        url =
            "/" ++ abbr ++ ".svg"

        desc : String
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
        index : Int
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
        , Html.Attributes.style "height" "2rem" |> htmlAttribute
        , Html.Attributes.style "top" (String.fromInt (2 * index) ++ "rem") |> htmlAttribute
        , Html.Attributes.id "bookmark" |> htmlAttribute
        , Transition.properties [ Transition.property "top" 250 [] ] |> Element.htmlAttribute
        , width fill
        ]
        [ el
            ([ ( "width", "0" )
             , ( "height", "0" )
             , ( "margin-left", "8px" )
             , ( "border-top", "1rem solid var(--background-color)" )
             , ( "border-bottom", "1rem solid var(--background-color)" )
             , ( "border-left", "1rem solid transparent" )
             ]
                |> List.map (\( key, value ) -> htmlAttribute (Html.Attributes.style key value))
            )
            none
        , el
            [ Html.Attributes.style "background" "var(--background-color)" |> htmlAttribute
            , Html.Attributes.style "height" "2rem" |> htmlAttribute
            , width fill
            ]
            none
        ]
