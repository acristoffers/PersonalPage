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

module About exposing (view)

import Element exposing (..)
import Element.Font
import Html.Attributes
import I18n.I18n exposing (tr)
import Types exposing (..)

view : Model -> Element Msg
view model =
    column
        [ width fill ]
        [ paragraph
            [ Element.Font.justify ]
            [ text (tr model.lang "about_me") ]
        , el [ Html.Attributes.class "font1rem" |> htmlAttribute ] none
        , columnOrRow model
            [ width fill
            , padding 16
            , spacing 16
            , Html.Attributes.class "font07rem" |> htmlAttribute
            ]
            [ downloads model
            , contacts model
            , languages model
            ]
        ]

columnOrRow : Model -> List (Element.Attribute Msg) -> List (Element.Element Msg) -> Element Msg
columnOrRow model =
    if model.device.class == Phone then
        column

    else
        row

downloads : Model -> Element Msg
downloads model =
    el [ Html.Attributes.class "font1rem" |> htmlAttribute, Element.Font.bold ] (text " ")
        :: ([ ( tr model.lang "resume", "/resume.pdf#view=FitH" )
            , ( "PhD's Thesis", "/phd-thesis.pdf#view=FitH" )
            , ( "Master's Thesis", "/master-thesis.pdf#view=FitH" )
            , ( "Graduation's Memoir", "/Monografia.pdf#view=FitH" )
            , ( "Apostila de Python 3", "/Python3.pdf#view=FitH" )
            , ( "Apostila de MATLAB", "/MATLAB.pdf#view=FitH" )
            , ( tr model.lang "gpg_public_key", "/PublicKey.asc" )
            , ( tr model.lang "age_public_key", "/PublicKey.age" )
            ]
                |> List.map (\( label, url ) -> underlinedDownload url label)
           )
        |> column [ spacing 16, width fill, alignTop, Html.Attributes.class "about-list" |> htmlAttribute ]

contacts : Model -> Element Msg
contacts model =
    el [ Html.Attributes.class "font1rem" |> htmlAttribute, Element.Font.bold ] (text (tr model.lang "contacts"))
        :: ([ ( "Email", "mailto:acristoffers@startmail.com" )
            , ( "Github", "https://www.github.com/acristoffers" )
            , ( "Mastodon", "https://mastodon.online/@acristoffers" )
            , ( "Matrix", "https://matrix.to/#/@acristoffers:linuxdelta.com" )
            ]
                |> List.map (\( label, url ) -> underlinedLink url label)
           )
        |> column [ spacing 16, width fill, alignTop, Html.Attributes.class "about-list" |> htmlAttribute ]

languages : Model -> Element Msg
languages model =
    el [ Html.Attributes.class "font1rem" |> htmlAttribute, Element.Font.bold ] (text (tr model.lang "languages"))
        :: ([ ( tr model.lang "pt", tr model.lang "native" )
            , ( tr model.lang "en", "C1/C2" )
            , ( tr model.lang "de", "B2/C1" )
            , ( tr model.lang "fr", "B2/C1" )
            ]
                |> List.map (\( lang, level ) -> underlinedText (lang ++ " (" ++ level ++ ")"))
           )
        |> column [ spacing 16, width fill, alignTop, Html.Attributes.class "about-list" |> htmlAttribute ]

underlinedText : String -> Element Msg
underlinedText label =
    el
        [ width fill
        , Html.Attributes.style "border-bottom" "1px solid black" |> htmlAttribute
        , Html.Attributes.style "padding-top" "8px" |> htmlAttribute
        , Html.Attributes.style "padding-bottom" "16px" |> htmlAttribute
        ]
        (text label)

underlinedLink : String -> String -> Element Msg
underlinedLink url label =
    link
        [ width fill
        , Html.Attributes.style "border-bottom" "1px solid black" |> htmlAttribute
        , Html.Attributes.style "padding-top" "8px" |> htmlAttribute
        , Html.Attributes.style "padding-bottom" "16px" |> htmlAttribute
        ]
        { url = url, label = text label }

underlinedDownload : String -> String -> Element Msg
underlinedDownload url label =
    download
        [ width fill
        , Html.Attributes.style "border-bottom" "1px solid black" |> htmlAttribute
        , Html.Attributes.style "padding-top" "8px" |> htmlAttribute
        , Html.Attributes.style "padding-bottom" "16px" |> htmlAttribute
        ]
        { url = url, label = text label }
