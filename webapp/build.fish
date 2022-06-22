rm public/app.css public/app.js &> /dev/null
sass -s compressed src/App.scss public/app.css
elm make src/Main.elm --optimize --output=app.js
# npm install uglify-js --global
uglifyjs app.js --output app2.js --compress 'pure_funcs=[F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9],pure_getters,keep_fargs=false,unsafe_comps,unsafe'
uglifyjs app2.js --mangle --output public/app.js
rm app.js app2.js public/app.css.map

