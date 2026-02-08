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


module Experience exposing (view)

import Element exposing (..)
import Element.Font
import Html.Attributes
import I18n.I18n exposing (tr, trList)
import Types exposing (..)


view : Model -> Element Msg
view model =
    column
        [ width fill, spacing 24, Element.Font.justify ]
        (List.concat
            [ [ paragraph [ Element.Font.bold, Element.Font.size 24 ] [ text (tr model.lang "experience_title") ] ]
            , experienceElements model
            , [ paragraph [ Element.Font.bold, Element.Font.size 24 ] [ text (tr model.lang "education") ] ]
            , educationElements model
            ]
        )


experienceElements : Model -> List (Element Msg)
experienceElements model =
    experiences model
        |> List.map
            (\xp ->
                row [ width fill, spacing 16 ]
                    [ el
                        [ Html.Attributes.style "background" "white" |> htmlAttribute
                        , Html.Attributes.style "padding" "5px" |> htmlAttribute
                        , Html.Attributes.style "border-radius" "10px" |> htmlAttribute
                        , Html.Attributes.style "min-height" "74px" |> htmlAttribute
                        , alignTop
                        ]
                        (image
                            [ width (px 64)
                            , Html.Attributes.style "margin" "auto" |> htmlAttribute
                            , Html.Attributes.class "xp-img" |> htmlAttribute
                            ]
                            { src = xp.img, description = "logo" }
                        )
                    , column [ width fill, spacing 8 ]
                        [ paragraph [ Html.Attributes.class "font1rem" |> htmlAttribute, Element.Font.bold ] [ text xp.title ]
                        , paragraph [ Html.Attributes.class "font1rem" |> htmlAttribute ] [ text xp.position ]
                        , paragraph [ Html.Attributes.class "font1rem" |> htmlAttribute, Element.Font.color (rgba 0.804 0.839 0.957 0.8) ] [ text xp.date ]
                        , paragraph [ Html.Attributes.class "font07rem" |> htmlAttribute ] [ text xp.description ]
                        , bulletList xp.subItems
                        ]
                    ]
            )


educationElements : Model -> List (Element Msg)
educationElements model =
    education model
        |> List.map
            (\xp ->
                row [ width fill, spacing 16 ]
                    [ el
                        [ Html.Attributes.style "background" "white" |> htmlAttribute
                        , Html.Attributes.style "padding" "5px" |> htmlAttribute
                        , Html.Attributes.style "border-radius" "10px" |> htmlAttribute
                        , Html.Attributes.style "min-height" "74px" |> htmlAttribute
                        , alignTop
                        ]
                        (image
                            [ width (px 64)
                            , Html.Attributes.style "margin" "auto" |> htmlAttribute
                            ]
                            { src = xp.img, description = "logo" }
                        )
                    , column [ width fill, spacing 8 ]
                        [ paragraph [ Html.Attributes.class "font1rem" |> htmlAttribute, Element.Font.bold ] [ text xp.title ]
                        , paragraph [ Html.Attributes.class "font1rem" |> htmlAttribute ] [ text xp.position ]
                        , paragraph [ Html.Attributes.class "font1rem" |> htmlAttribute, Element.Font.color (rgba 0.804 0.839 0.957 0.8) ] [ text xp.date ]
                        , paragraph [ Html.Attributes.class "font07rem" |> htmlAttribute ] [ text xp.description ]
                        , el [ height (px 8) ] none
                        , bulletList xp.subItems
                        ]
                    ]
            )


experiences : Model -> List Experience
experiences model =
    [ Experience "/vitibot.png" "Vitibot" "04/2024 - " (tr model.lang "vitibot_pos") (tr model.lang "vitibot_desc") []
    , Experience "/acal.jpg" "Acal BFi Germany GmbH" "03/2016 - 08/2016" (tr model.lang "intern") (tr model.lang "acal_desc") []
    , Experience "/cbmmg.png" "Corpo de Bombeiros Militar de Minas Gerais" "01/2010 - 12/2013" (tr model.lang "soldier") (tr model.lang "cbmmg_desc") []
    ]


education : Model -> List Experience
education model =
    [ Experience "/urca.png" "Université de Reims Champagne-Ardenne" "03/2021 - 09/2024" (tr model.lang "phd_control") (tr model.lang "phd_desc") (trList model.lang "phd_items")
    , Experience "/cefet-ufsj.jpg" "Centro Federal de Educação Tecnológica de Minas Gerais / Universidade Federal de São Jõao del-Rei" "08/2019 - 12/2020" (tr model.lang "mes_control") (tr model.lang "cefet_mes_desc") []
    , Experience "/cefet.png" "Centro Federal de Educação Tecnológica de Minas Gerais" "04/2013 - 07/2019" (tr model.lang "eng_meca") (tr model.lang "cefet_desc") (trList model.lang "cefet_items")
    , Experience "/fuas.png" "Frankfurt University Of Applied Sciences" "06/2015 - 08/2016" (tr model.lang "exchange_student") (tr model.lang "fuas_desc") []
    , Experience "/uga.png" "Université Joseph Fourier (now Université Grenoble Alpes)" "01/2015 - 03/2015" (tr model.lang "exchange_student") (tr model.lang "uga_desc") []
    ]


bulletList : List String -> Element Msg
bulletList xs =
    column
        [ width fill, Html.Attributes.class "font07rem" |> htmlAttribute, spacing 8, Element.Font.color (rgba 0.804 0.839 0.957 0.8) ]
        (List.map (\x -> row [ width fill, spacing 8 ] [ el [ alignTop ] (text "•"), paragraph [] [ text x ] ]) xs)


type alias Experience =
    { img : String
    , title : String
    , date : String
    , position : String
    , description : String
    , subItems : List String
    }
