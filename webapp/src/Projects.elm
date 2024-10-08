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


module Projects exposing (view)

import Element exposing (..)
import Element.Events exposing (onClick)
import Element.Font
import Html.Attributes
import I18n.I18n exposing (tr)
import Types exposing (..)


view : Model -> Element Msg
view model =
    let
        ps : List Proj
        ps =
            projects model
    in
    column [ width fill, spacing 64 ]
        (List.concat
            [ if model.device.class == Desktop then
                [ row
                    [ width fill
                    , spaceEvenly
                    , Html.Attributes.style "background" "white" |> htmlAttribute
                    , Html.Attributes.style "border-radius" "10px" |> htmlAttribute
                    , Html.Attributes.style "padding" "10px" |> htmlAttribute
                    ]
                    (List.map projectLink ps)
                ]

              else
                [ none ]
            , List.map (projectElement model) ps
            ]
        )


projectLink : Proj -> Element Msg
projectLink proj =
    link []
        { url = "/projects/" ++ proj.key
        , label =
            column
                [ spacing 8
                , centerX
                , Html.Attributes.class "font07rem" |> htmlAttribute
                , Html.Attributes.style "text-align" "center" |> htmlAttribute
                , Html.Attributes.style "color" "black" |> htmlAttribute
                ]
                [ image [ centerX, height (px 48) ] { src = proj.icon, description = proj.name }
                , paragraph [ centerX ] [ text proj.name ]
                ]
        }


rowOrCol : Model -> List (Attribute msg) -> List (Element msg) -> Element msg
rowOrCol model =
    if model.device.class == Desktop then
        row

    else
        column


projectElement : Model -> Proj -> Element Msg
projectElement model proj =
    if model.route == Projects proj.proj || model.device.class == Phone then
        rowOrCol model
            [ width fill, spacing 16 ]
            [ column [ width (fillPortion 4), spacing 16, alignTop ]
                [ newTabLink []
                    { url = proj.url
                    , label =
                        row
                            [ width fill
                            , Element.Font.bold
                            , spacing 8
                            , Html.Attributes.style "padding" "10px" |> htmlAttribute
                            ]
                            [ el
                                [ height (px 58)
                                , Html.Attributes.style "background" "white" |> htmlAttribute
                                , Html.Attributes.style "border-radius" "10px" |> htmlAttribute
                                , Html.Attributes.style "padding" "5px" |> htmlAttribute
                                , Html.Attributes.style "min-width" "58px" |> htmlAttribute
                                ]
                                (image
                                    [ height (px 48)
                                    , Html.Attributes.style "margin" "auto" |> htmlAttribute
                                    ]
                                    { src = proj.icon, description = proj.name }
                                )
                            , paragraph [ Html.Attributes.class "font2rem" |> htmlAttribute ] [ text proj.name ]
                            ]
                    }
                , paragraph [ Element.Font.justify ] [ text proj.desc ]
                ]
            , if not (List.isEmpty proj.screenshots) then
                wrappedRow [ width (fillPortion 6), spacing 16, alignTop ]
                    (proj.screenshots
                        |> List.map
                            (\ss ->
                                column [ spacing 8, alignTop, width (fill |> minimum 300) ]
                                    [ image
                                        [ width fill
                                        , Html.Attributes.style "cursor" "pointer" |> htmlAttribute
                                        , onClick (SetFullscreenImage (Just ss.hires))
                                        ]
                                        { src = ss.lowres, description = "screenshot" }
                                    , paragraph [ Html.Attributes.class "font07rem" |> htmlAttribute, Element.Font.justify ] [ text ss.desc ]
                                    ]
                            )
                    )

              else
                none
            ]

    else
        none


projects : Model -> List Proj
projects model =
    [ Proj Lachesis
        "lachesis"
        "Lachesis"
        "/lachesis.svg"
        (tr model.lang "lachesis_desc")
        "https://github.com/acristoffers/lachesis"
        ([ 1, 2, 3, 4 ] |> List.map (\i -> ScreenShot ("/screenshots/Lachesis" ++ String.fromInt i ++ ".jpg") ("/screenshots/Lachesis" ++ String.fromInt i ++ ".png") (tr model.lang ("lachesis" ++ String.fromInt i ++ "_desc"))))
    , Proj Moirai "moirai" "moirai" "/python.svg" (tr model.lang "moirai_desc") "https://github.com/acristoffers/moirai" []
    , Proj Ahio "ahio" "AHIO" "/python.svg" (tr model.lang "ahio_desc") "https://github.com/acristoffers/ahio" []
    , Proj Void
        "void"
        "Void"
        "/void.svg"
        (tr model.lang "void_desc")
        "https://github.com/acristoffers/void"
        ([ 1, 2, 3, 4 ] |> List.map (\i -> ScreenShot ("/screenshots/Void" ++ String.fromInt i ++ ".jpg") ("/screenshots/Void" ++ String.fromInt i ++ ".png") (tr model.lang ("void" ++ String.fromInt i ++ "_desc"))))
    , Proj TestsDatabase
        "tests-database"
        "Tests Database"
        "/tests-database.png"
        (tr model.lang "tests_database_desc")
        "https://github.com/acristoffers/testsdatabase"
        ([ 1, 2, 3 ] |> List.map (\i -> ScreenShot ("/screenshots/TestsDatabase" ++ String.fromInt i ++ ".png") ("/screenshots/TestsDatabase" ++ String.fromInt i ++ ".png") (tr model.lang ("tb_ss" ++ String.fromInt i ++ "_desc"))))
    , Proj Tracker
        "tracker"
        "Tracker"
        "/tracker.svg"
        (tr model.lang "tracker_desc")
        "https://github.com/acristoffers/tracker"
        ([ 1, 2, 3 ] |> List.map (\i -> ScreenShot ("/screenshots/Tracker" ++ String.fromInt i ++ ".png") ("/screenshots/Tracker" ++ String.fromInt i ++ ".png") ""))
    , Proj CEF "cef" "CEF3 Simple Sample" "/cef_logo.png" (tr model.lang "cefss_desc") "https://github.com/acristoffers/CEF3SimpleSample" []
    , Proj SIGAA
        "sigaa:notas"
        "SIGAA:Notas"
        "/sigaa_logo.svg"
        (tr model.lang "sigaa_desc")
        "https://github.com/acristoffers/SIGAAGrades"
        ([ 1, 2, 3, 4 ] |> List.map (\i -> ScreenShot ("/screenshots/SIGAA_Notas" ++ String.fromInt i ++ ".png") ("/screenshots/SIGAA_Notas" ++ String.fromInt i ++ ".png") (tr model.lang ("sigaa_notas" ++ String.fromInt i ++ "_desc"))))
    ]


type alias Proj =
    { proj : Project
    , key : String
    , name : String
    , icon : String
    , desc : String
    , url : String
    , screenshots : List ScreenShot
    }


type alias ScreenShot =
    { lowres : String
    , hires : String
    , desc : String
    }
