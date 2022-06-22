import 'elm-keyboard-shortcut'

const lang = localStorage.getItem("lang") || "en";

const app = Elm.Main.init({
  node: document.getElementById("root"),
  flags: {
    height: window.innerHeight,
    width: window.innerWidth,
    ratio: window.devicePixelRatio,
    lang: lang
  }
});

app.ports.setLang.subscribe(function (lang) {
  localStorage.setItem("lang", lang);
  document.querySelector("html").setAttribute("lang", lang);
});
