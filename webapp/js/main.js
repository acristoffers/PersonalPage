/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2022 Álan Crístoffer e Sousa
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import 'elm-keyboard-shortcut'

const path = localStorage.getItem("path");
if (path != null) {
  localStorage.removeItem("path");
  history.pushState({}, "", path);
}

const root = document.getElementById("root");
const rw = screen.width / root.clientWidth;

const app = Elm.Main.init({
  node: root,
  flags: {
    width: innerWidth,
    height: innerHeight,
    screenWidth: rw,
    lang: localStorage.getItem("lang") || "en"
  }
});

app.ports.setLang.subscribe(function (lang) {
  localStorage.setItem("lang", lang);
  document.querySelector("html").setAttribute("lang", lang);
});

const html = document.querySelector(':root');
let fontSize = Math.round(parseFloat(getComputedStyle(html).getPropertyValue("font-size").slice(0, -2)));
html.style.fontSize = fontSize.toString() + "px";

