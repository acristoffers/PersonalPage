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

import Browser
import Browser.Navigation
import Element exposing (..)
import Element.Background
import Element.Events exposing (onClick)
import Element.Font
import Html exposing (Html)
import Html.Attributes
import I18n.I18n exposing (tr)
import Routing exposing (..)
import Sidebar
import Types exposing (..)
import Url
import Url.Parser exposing ((</>), Parser, s)


view : Model -> Project -> Element Msg
view model project =
    column [ width fill, spacing 64 ]
        (List.concat
            [ [ row [ width fill, spaceEvenly ] (List.map projectLink (projects model)) ]
            , List.map (projectElement model) (projects model)
            ]
        )


projectLink : Proj -> Element Msg
projectLink proj =
    link []
        { url = "/projects/" ++ proj.key
        , label =
            column [ spacing 8, centerX, Html.Attributes.style "text-align" "center" |> htmlAttribute ]
                [ image [ centerX, height (px 48) ] { src = proj.icon, description = proj.name }
                , paragraph [ centerX, Element.Font.size 16 ] [ text proj.name ]
                ]
        }


projectElement : Model -> Proj -> Element Msg
projectElement model proj =
    if model.route == Projects proj.proj then
        row [ width fill, spacing 8 ]
            [ column [ width (fillPortion 4), spacing 16, alignTop ]
                [ row [ width fill, Element.Font.size 38, Element.Font.bold, spacing 8 ]
                    [ image [ height (px 48) ] { src = proj.icon, description = proj.name }
                    , text proj.name
                    ]
                , paragraph [ Element.Font.size 18, Element.Font.justify ] [ text proj.desc ]
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
                                    , paragraph [ Element.Font.justify, Element.Font.size 16 ] [ text ss.desc ]
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
