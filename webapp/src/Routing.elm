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


module Routing exposing (routeParser)

import Types exposing (..)
import Url.Parser exposing ((</>), Parser, s)


subrouteParser : Parser (Project -> a) a
subrouteParser =
    Url.Parser.oneOf
        [ Url.Parser.map TreeSitterMatlab <| Url.Parser.top
        , Url.Parser.map Lachesis <| s "lachesis"
        , Url.Parser.map Moirai <| s "moirai"
        , Url.Parser.map Ahio <| s "ahio"
        , Url.Parser.map TreeSitterMatlab <| s "tree-sitter-matlab"
        , Url.Parser.map LedgerNvim <| s "ledger.nvim"
        , Url.Parser.map Cgen <| s "cgen"
        , Url.Parser.map Dbkp <| s "dbkp"
        , Url.Parser.map GnomeRectangle <| s "gnome-rectangle"
        , Url.Parser.map KwinRectangle <| s "kwin-rectangle"
        , Url.Parser.map TmuxTui <| s "tmux-tui"
        , Url.Parser.map TreeSitterWbproto <| s "tree-sitter-wbproto"
        , Url.Parser.map WbprotoBeautifier <| s "wbproto-beautifier"
        , Url.Parser.map Void <| s "void"
        , Url.Parser.map TestsDatabase <| s "tests-database"
        , Url.Parser.map Tracker <| s "tracker"
        , Url.Parser.map CEF <| s "cef"
        , Url.Parser.map SIGAA <| s "sigaa:notas"
        ]


routeParser : Parser (Route -> a) a
routeParser =
    Url.Parser.oneOf
        [ Url.Parser.map About <| Url.Parser.top
        , Url.Parser.map About <| s "about"
        , Url.Parser.map Projects <| s "projects" </> subrouteParser
        , Url.Parser.map Publications <| s "publications"
        , Url.Parser.map Experience <| s "experience"
        ]
