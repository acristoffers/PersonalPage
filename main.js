(()=>{var t={363:()=>{(function(){"use strict";var t=window.Document.prototype.createElement,e=window.Document.prototype.createElementNS,n=window.Document.prototype.importNode,o=window.Document.prototype.prepend,r=window.Document.prototype.append,i=window.DocumentFragment.prototype.prepend,l=window.DocumentFragment.prototype.append,a=window.Node.prototype.cloneNode,c=window.Node.prototype.appendChild,s=window.Node.prototype.insertBefore,u=window.Node.prototype.removeChild,h=window.Node.prototype.replaceChild,d=Object.getOwnPropertyDescriptor(window.Node.prototype,"textContent"),f=window.Element.prototype.attachShadow,p=Object.getOwnPropertyDescriptor(window.Element.prototype,"innerHTML"),m=window.Element.prototype.getAttribute,y=window.Element.prototype.setAttribute,g=window.Element.prototype.removeAttribute,v=window.Element.prototype.toggleAttribute,w=window.Element.prototype.getAttributeNS,E=window.Element.prototype.setAttributeNS,b=window.Element.prototype.removeAttributeNS,_=window.Element.prototype.insertAdjacentElement,C=window.Element.prototype.insertAdjacentHTML,N=window.Element.prototype.prepend,S=window.Element.prototype.append,T=window.Element.prototype.before,D=window.Element.prototype.after,k=window.Element.prototype.replaceWith,A=window.Element.prototype.remove,O=window.HTMLElement,j=Object.getOwnPropertyDescriptor(window.HTMLElement.prototype,"innerHTML"),L=window.HTMLElement.prototype.insertAdjacentElement,x=window.HTMLElement.prototype.insertAdjacentHTML,F=new Set;function M(t){var e=F.has(t);return t=/^[a-z][.0-9_a-z]*-[-.0-9_a-z]*$/.test(t),!e&&t}"annotation-xml color-profile font-face font-face-src font-face-uri font-face-format font-face-name missing-glyph".split(" ").forEach((function(t){return F.add(t)}));var H=document.contains?document.contains.bind(document):document.documentElement.contains.bind(document.documentElement);function I(t){var e=t.isConnected;if(void 0!==e)return e;if(H(t))return!0;for(;t&&!(t.__CE_isImportDocument||t instanceof Document);)t=t.parentNode||(window.ShadowRoot&&t instanceof ShadowRoot?t.host:void 0);return!(!t||!(t.__CE_isImportDocument||t instanceof Document))}function P(t){var e=t.children;if(e)return Array.prototype.slice.call(e);for(e=[],t=t.firstChild;t;t=t.nextSibling)t.nodeType===Node.ELEMENT_NODE&&e.push(t);return e}function U(t,e){for(;e&&e!==t&&!e.nextSibling;)e=e.parentNode;return e&&e!==t?e.nextSibling:null}function R(t,e,n){for(var o=t;o;){if(o.nodeType===Node.ELEMENT_NODE){var r=o;e(r);var i=r.localName;if("link"===i&&"import"===r.getAttribute("rel")){if(o=r.import,void 0===n&&(n=new Set),o instanceof Node&&!n.has(o))for(n.add(o),o=o.firstChild;o;o=o.nextSibling)R(o,e,n);o=U(t,r);continue}if("template"===i){o=U(t,r);continue}if(r=r.__CE_shadowRoot)for(r=r.firstChild;r;r=r.nextSibling)R(r,e,n)}o=o.firstChild?o.firstChild:U(t,o)}}function W(){var t=!(null==at||!at.noDocumentConstructionObserver),e=!(null==at||!at.shadyDomFastWalk);this.m=[],this.g=[],this.j=!1,this.shadyDomFastWalk=e,this.I=!t}function z(t,e,n,o){var r=window.ShadyDOM;if(t.shadyDomFastWalk&&r&&r.inUse){if(e.nodeType===Node.ELEMENT_NODE&&n(e),e.querySelectorAll)for(t=r.nativeMethods.querySelectorAll.call(e,"*"),e=0;e<t.length;e++)n(t[e])}else R(e,n,o)}function B(t,e){t.j&&z(t,e,(function(e){return G(t,e)}))}function G(t,e){if(t.j&&!e.__CE_patched){e.__CE_patched=!0;for(var n=0;n<t.m.length;n++)t.m[n](e);for(n=0;n<t.g.length;n++)t.g[n](e)}}function K(t,e){var n=[];for(z(t,e,(function(t){return n.push(t)})),e=0;e<n.length;e++){var o=n[e];1===o.__CE_state?t.connectedCallback(o):Y(t,o)}}function q(t,e){var n=[];for(z(t,e,(function(t){return n.push(t)})),e=0;e<n.length;e++){var o=n[e];1===o.__CE_state&&t.disconnectedCallback(o)}}function J(t,e,n){var o=(n=void 0===n?{}:n).J,r=n.upgrade||function(e){return Y(t,e)},i=[];for(z(t,e,(function(e){if(t.j&&G(t,e),"link"===e.localName&&"import"===e.getAttribute("rel")){var n=e.import;n instanceof Node&&(n.__CE_isImportDocument=!0,n.__CE_registry=document.__CE_registry),n&&"complete"===n.readyState?n.__CE_documentLoadHandled=!0:e.addEventListener("load",(function(){var n=e.import;if(!n.__CE_documentLoadHandled){n.__CE_documentLoadHandled=!0;var i=new Set;o&&(o.forEach((function(t){return i.add(t)})),i.delete(n)),J(t,n,{J:i,upgrade:r})}}))}else i.push(e)}),o),e=0;e<i.length;e++)r(i[e])}function Y(t,e){try{var n=e.ownerDocument,o=n.__CE_registry,r=o&&(n.defaultView||n.__CE_isImportDocument)?rt(o,e.localName):void 0;if(r&&void 0===e.__CE_state){r.constructionStack.push(e);try{try{if(new r.constructorFunction!==e)throw Error("The custom element constructor did not produce the element being upgraded.")}finally{r.constructionStack.pop()}}catch(t){throw e.__CE_state=2,t}if(e.__CE_state=1,e.__CE_definition=r,r.attributeChangedCallback&&e.hasAttributes()){var i=r.observedAttributes;for(r=0;r<i.length;r++){var l=i[r],a=e.getAttribute(l);null!==a&&t.attributeChangedCallback(e,l,null,a,null)}}I(e)&&t.connectedCallback(e)}}catch(t){V(t)}}function Z(n,o,r,i){var l=o.__CE_registry;if(l&&(null===i||"http://www.w3.org/1999/xhtml"===i)&&(l=rt(l,r)))try{var a=new l.constructorFunction;if(void 0===a.__CE_state||void 0===a.__CE_definition)throw Error("Failed to construct '"+r+"': The returned value was not constructed with the HTMLElement constructor.");if("http://www.w3.org/1999/xhtml"!==a.namespaceURI)throw Error("Failed to construct '"+r+"': The constructed element's namespace must be the HTML namespace.");if(a.hasAttributes())throw Error("Failed to construct '"+r+"': The constructed element must not have any attributes.");if(null!==a.firstChild)throw Error("Failed to construct '"+r+"': The constructed element must not have any children.");if(null!==a.parentNode)throw Error("Failed to construct '"+r+"': The constructed element must not have a parent node.");if(a.ownerDocument!==o)throw Error("Failed to construct '"+r+"': The constructed element's owner document is incorrect.");if(a.localName!==r)throw Error("Failed to construct '"+r+"': The constructed element's local name is incorrect.");return a}catch(l){return V(l),o=null===i?t.call(o,r):e.call(o,i,r),Object.setPrototypeOf(o,HTMLUnknownElement.prototype),o.__CE_state=2,o.__CE_definition=void 0,G(n,o),o}return G(n,o=null===i?t.call(o,r):e.call(o,i,r)),o}function V(t){var e="",n="",o=0,r=0;t instanceof Error?(e=t.message,n=t.sourceURL||t.fileName||"",o=t.line||t.lineNumber||0,r=t.column||t.columnNumber||0):e="Uncaught "+String(t);var i=void 0;void 0===ErrorEvent.prototype.initErrorEvent?i=new ErrorEvent("error",{cancelable:!0,message:e,filename:n,lineno:o,colno:r,error:t}):((i=document.createEvent("ErrorEvent")).initErrorEvent("error",!1,!0,e,n,o),i.preventDefault=function(){Object.defineProperty(this,"defaultPrevented",{configurable:!0,get:function(){return!0}})}),void 0===i.error&&Object.defineProperty(i,"error",{configurable:!0,enumerable:!0,get:function(){return t}}),window.dispatchEvent(i),i.defaultPrevented||console.error(t)}function X(){var t=this;this.g=void 0,this.F=new Promise((function(e){t.l=e}))}function $(t){var e=document;this.l=void 0,this.h=t,this.g=e,J(this.h,this.g),"loading"===this.g.readyState&&(this.l=new MutationObserver(this.G.bind(this)),this.l.observe(this.g,{childList:!0,subtree:!0}))}function Q(t){t.l&&t.l.disconnect()}function tt(t){this.s=new Map,this.u=new Map,this.C=new Map,this.A=!1,this.B=new Map,this.o=function(t){return t()},this.i=!1,this.v=[],this.h=t,this.D=t.I?new $(t):void 0}function et(t,e){if(!M(e))throw new SyntaxError("The element name '"+e+"' is not valid.");if(rt(t,e))throw Error("A custom element with name '"+e+"' has already been defined.");if(t.A)throw Error("A custom element is already being defined.")}function nt(t,e,n){var o;t.A=!0;try{var r=n.prototype;if(!(r instanceof Object))throw new TypeError("The custom element constructor's prototype is not an object.");var i=function(t){var e=r[t];if(void 0!==e&&!(e instanceof Function))throw Error("The '"+t+"' callback must be a function.");return e},l=i("connectedCallback"),a=i("disconnectedCallback"),c=i("adoptedCallback"),s=(o=i("attributeChangedCallback"))&&n.observedAttributes||[]}catch(t){throw t}finally{t.A=!1}return n={localName:e,constructorFunction:n,connectedCallback:l,disconnectedCallback:a,adoptedCallback:c,attributeChangedCallback:o,observedAttributes:s,constructionStack:[]},t.u.set(e,n),t.C.set(n.constructorFunction,n),n}function ot(t){if(!1!==t.i){t.i=!1;for(var e=[],n=t.v,o=new Map,r=0;r<n.length;r++)o.set(n[r],[]);for(J(t.h,document,{upgrade:function(n){if(void 0===n.__CE_state){var r=n.localName,i=o.get(r);i?i.push(n):t.u.has(r)&&e.push(n)}}}),r=0;r<e.length;r++)Y(t.h,e[r]);for(r=0;r<n.length;r++){for(var i=n[r],l=o.get(i),a=0;a<l.length;a++)Y(t.h,l[a]);(i=t.B.get(i))&&i.resolve(void 0)}n.length=0}}function rt(t,e){var n=t.u.get(e);if(n)return n;if(n=t.s.get(e)){t.s.delete(e);try{return nt(t,e,n())}catch(t){V(t)}}}function it(t,e,n){function o(e){return function(n){for(var o=[],r=0;r<arguments.length;++r)o[r]=arguments[r];r=[];for(var i=[],l=0;l<o.length;l++){var a=o[l];if(a instanceof Element&&I(a)&&i.push(a),a instanceof DocumentFragment)for(a=a.firstChild;a;a=a.nextSibling)r.push(a);else r.push(a)}for(e.apply(this,o),o=0;o<i.length;o++)q(t,i[o]);if(I(this))for(o=0;o<r.length;o++)(i=r[o])instanceof Element&&K(t,i)}}void 0!==n.prepend&&(e.prepend=o(n.prepend)),void 0!==n.append&&(e.append=o(n.append))}W.prototype.connectedCallback=function(t){var e=t.__CE_definition;if(e.connectedCallback)try{e.connectedCallback.call(t)}catch(t){V(t)}},W.prototype.disconnectedCallback=function(t){var e=t.__CE_definition;if(e.disconnectedCallback)try{e.disconnectedCallback.call(t)}catch(t){V(t)}},W.prototype.attributeChangedCallback=function(t,e,n,o,r){var i=t.__CE_definition;if(i.attributeChangedCallback&&-1<i.observedAttributes.indexOf(e))try{i.attributeChangedCallback.call(t,e,n,o,r)}catch(t){V(t)}},X.prototype.resolve=function(t){if(this.g)throw Error("Already resolved.");this.g=t,this.l(t)},$.prototype.G=function(t){var e=this.g.readyState;for("interactive"!==e&&"complete"!==e||Q(this),e=0;e<t.length;e++)for(var n=t[e].addedNodes,o=0;o<n.length;o++)J(this.h,n[o])},tt.prototype.H=function(t,e){var n=this;if(!(e instanceof Function))throw new TypeError("Custom element constructor getters must be functions.");et(this,t),this.s.set(t,e),this.v.push(t),this.i||(this.i=!0,this.o((function(){return ot(n)})))},tt.prototype.define=function(t,e){var n=this;if(!(e instanceof Function))throw new TypeError("Custom element constructors must be functions.");et(this,t),nt(this,t,e),this.v.push(t),this.i||(this.i=!0,this.o((function(){return ot(n)})))},tt.prototype.upgrade=function(t){J(this.h,t)},tt.prototype.get=function(t){if(t=rt(this,t))return t.constructorFunction},tt.prototype.whenDefined=function(t){if(!M(t))return Promise.reject(new SyntaxError("'"+t+"' is not a valid custom element name."));var e=this.B.get(t);if(e)return e.F;e=new X,this.B.set(t,e);var n=this.u.has(t)||this.s.has(t);return t=-1===this.v.indexOf(t),n&&t&&e.resolve(void 0),e.F},tt.prototype.polyfillWrapFlushCallback=function(t){this.D&&Q(this.D);var e=this.o;this.o=function(n){return t((function(){return e(n)}))}},tt.prototype.define=tt.prototype.define,tt.prototype.upgrade=tt.prototype.upgrade,tt.prototype.get=tt.prototype.get,tt.prototype.whenDefined=tt.prototype.whenDefined,tt.prototype.polyfillDefineLazy=tt.prototype.H,tt.prototype.polyfillWrapFlushCallback=tt.prototype.polyfillWrapFlushCallback;var lt={},at=window.customElements;function ct(){var F=new W;!function(e){function n(){var n=this.constructor,o=document.__CE_registry.C.get(n);if(!o)throw Error("Failed to construct a custom element: The constructor was not registered with `customElements`.");var r=o.constructionStack;if(0===r.length)return r=t.call(document,o.localName),Object.setPrototypeOf(r,n.prototype),r.__CE_state=1,r.__CE_definition=o,G(e,r),r;var i=r.length-1,l=r[i];if(l===lt)throw Error("Failed to construct '"+o.localName+"': This element was already constructed.");return r[i]=lt,Object.setPrototypeOf(l,n.prototype),G(e,l),l}n.prototype=O.prototype,Object.defineProperty(HTMLElement.prototype,"constructor",{writable:!0,configurable:!0,enumerable:!1,value:n}),window.HTMLElement=n}(F),function(t){Document.prototype.createElement=function(e){return Z(t,this,e,null)},Document.prototype.importNode=function(e,o){return e=n.call(this,e,!!o),this.__CE_registry?J(t,e):B(t,e),e},Document.prototype.createElementNS=function(e,n){return Z(t,this,n,e)},it(t,Document.prototype,{prepend:o,append:r})}(F),it(F,DocumentFragment.prototype,{prepend:i,append:l}),function(t){function e(e,n){Object.defineProperty(e,"textContent",{enumerable:n.enumerable,configurable:!0,get:n.get,set:function(e){if(this.nodeType===Node.TEXT_NODE)n.set.call(this,e);else{var o=void 0;if(this.firstChild){var r=this.childNodes,i=r.length;if(0<i&&I(this)){o=Array(i);for(var l=0;l<i;l++)o[l]=r[l]}}if(n.set.call(this,e),o)for(e=0;e<o.length;e++)q(t,o[e])}}})}Node.prototype.insertBefore=function(e,n){if(e instanceof DocumentFragment){var o=P(e);if(e=s.call(this,e,n),I(this))for(n=0;n<o.length;n++)K(t,o[n]);return e}return o=e instanceof Element&&I(e),n=s.call(this,e,n),o&&q(t,e),I(this)&&K(t,e),n},Node.prototype.appendChild=function(e){if(e instanceof DocumentFragment){var n=P(e);if(e=c.call(this,e),I(this))for(var o=0;o<n.length;o++)K(t,n[o]);return e}return n=e instanceof Element&&I(e),o=c.call(this,e),n&&q(t,e),I(this)&&K(t,e),o},Node.prototype.cloneNode=function(e){return e=a.call(this,!!e),this.ownerDocument.__CE_registry?J(t,e):B(t,e),e},Node.prototype.removeChild=function(e){var n=e instanceof Element&&I(e),o=u.call(this,e);return n&&q(t,e),o},Node.prototype.replaceChild=function(e,n){if(e instanceof DocumentFragment){var o=P(e);if(e=h.call(this,e,n),I(this))for(q(t,n),n=0;n<o.length;n++)K(t,o[n]);return e}o=e instanceof Element&&I(e);var r=h.call(this,e,n),i=I(this);return i&&q(t,n),o&&q(t,e),i&&K(t,e),r},d&&d.get?e(Node.prototype,d):function(t,e){t.j=!0,t.m.push(e)}(t,(function(t){e(t,{enumerable:!0,configurable:!0,get:function(){for(var t=[],e=this.firstChild;e;e=e.nextSibling)e.nodeType!==Node.COMMENT_NODE&&t.push(e.textContent);return t.join("")},set:function(t){for(;this.firstChild;)u.call(this,this.firstChild);null!=t&&""!==t&&c.call(this,document.createTextNode(t))}})}))}(F),function(t){function n(e,n){Object.defineProperty(e,"innerHTML",{enumerable:n.enumerable,configurable:!0,get:n.get,set:function(e){var o=this,r=void 0;if(I(this)&&(r=[],z(t,this,(function(t){t!==o&&r.push(t)}))),n.set.call(this,e),r)for(var i=0;i<r.length;i++){var l=r[i];1===l.__CE_state&&t.disconnectedCallback(l)}return this.ownerDocument.__CE_registry?J(t,this):B(t,this),e}})}function o(e,n){e.insertAdjacentElement=function(e,o){var r=I(o);return e=n.call(this,e,o),r&&q(t,o),I(e)&&K(t,o),e}}function r(e,n){function o(e,n){for(var o=[];e!==n;e=e.nextSibling)o.push(e);for(n=0;n<o.length;n++)J(t,o[n])}e.insertAdjacentHTML=function(t,e){if("beforebegin"===(t=t.toLowerCase())){var r=this.previousSibling;n.call(this,t,e),o(r||this.parentNode.firstChild,this)}else if("afterbegin"===t)r=this.firstChild,n.call(this,t,e),o(this.firstChild,r);else if("beforeend"===t)r=this.lastChild,n.call(this,t,e),o(r||this.firstChild,null);else{if("afterend"!==t)throw new SyntaxError("The value provided ("+String(t)+") is not one of 'beforebegin', 'afterbegin', 'beforeend', or 'afterend'.");r=this.nextSibling,n.call(this,t,e),o(this.nextSibling,r)}}}f&&(Element.prototype.attachShadow=function(e){if(e=f.call(this,e),t.j&&!e.__CE_patched){e.__CE_patched=!0;for(var n=0;n<t.m.length;n++)t.m[n](e)}return this.__CE_shadowRoot=e}),p&&p.get?n(Element.prototype,p):j&&j.get?n(HTMLElement.prototype,j):function(t,e){t.j=!0,t.g.push(e)}(t,(function(t){n(t,{enumerable:!0,configurable:!0,get:function(){return a.call(this,!0).innerHTML},set:function(t){var n="template"===this.localName,o=n?this.content:this,r=e.call(document,this.namespaceURI,this.localName);for(r.innerHTML=t;0<o.childNodes.length;)u.call(o,o.childNodes[0]);for(t=n?r.content:r;0<t.childNodes.length;)c.call(o,t.childNodes[0])}})})),Element.prototype.setAttribute=function(e,n){if(1!==this.__CE_state)return y.call(this,e,n);var o=m.call(this,e);y.call(this,e,n),n=m.call(this,e),t.attributeChangedCallback(this,e,o,n,null)},Element.prototype.setAttributeNS=function(e,n,o){if(1!==this.__CE_state)return E.call(this,e,n,o);var r=w.call(this,e,n);E.call(this,e,n,o),o=w.call(this,e,n),t.attributeChangedCallback(this,n,r,o,e)},Element.prototype.removeAttribute=function(e){if(1!==this.__CE_state)return g.call(this,e);var n=m.call(this,e);g.call(this,e),null!==n&&t.attributeChangedCallback(this,e,n,null,null)},v&&(Element.prototype.toggleAttribute=function(e,n){if(1!==this.__CE_state)return v.call(this,e,n);var o=m.call(this,e);return null!==o!==(n=v.call(this,e,n))&&t.attributeChangedCallback(this,e,o,n?"":null,null),n}),Element.prototype.removeAttributeNS=function(e,n){if(1!==this.__CE_state)return b.call(this,e,n);var o=w.call(this,e,n);b.call(this,e,n);var r=w.call(this,e,n);o!==r&&t.attributeChangedCallback(this,n,o,r,e)},L?o(HTMLElement.prototype,L):_&&o(Element.prototype,_),x?r(HTMLElement.prototype,x):C&&r(Element.prototype,C),it(t,Element.prototype,{prepend:N,append:S}),function(t){function e(e){return function(n){for(var o=[],r=0;r<arguments.length;++r)o[r]=arguments[r];r=[];for(var i=[],l=0;l<o.length;l++){var a=o[l];if(a instanceof Element&&I(a)&&i.push(a),a instanceof DocumentFragment)for(a=a.firstChild;a;a=a.nextSibling)r.push(a);else r.push(a)}for(e.apply(this,o),o=0;o<i.length;o++)q(t,i[o]);if(I(this))for(o=0;o<r.length;o++)(i=r[o])instanceof Element&&K(t,i)}}var n=Element.prototype;void 0!==T&&(n.before=e(T)),void 0!==D&&(n.after=e(D)),void 0!==k&&(n.replaceWith=function(e){for(var n=[],o=0;o<arguments.length;++o)n[o]=arguments[o];o=[];for(var r=[],i=0;i<n.length;i++){var l=n[i];if(l instanceof Element&&I(l)&&r.push(l),l instanceof DocumentFragment)for(l=l.firstChild;l;l=l.nextSibling)o.push(l);else o.push(l)}for(i=I(this),k.apply(this,n),n=0;n<r.length;n++)q(t,r[n]);if(i)for(q(t,this),n=0;n<o.length;n++)(r=o[n])instanceof Element&&K(t,r)}),void 0!==A&&(n.remove=function(){var e=I(this);A.call(this),e&&q(t,this)})}(t)}(F),window.CustomElementRegistry=tt,F=new tt(F),document.__CE_registry=F,Object.defineProperty(window,"customElements",{configurable:!0,enumerable:!0,value:F})}at&&!at.forcePolyfill&&"function"==typeof at.define&&"function"==typeof at.get||ct(),window.__CE_installPolyfill=ct}).call(self)},688:(t,e,n)=>{var o,r=/[\xc0-\xd6\xd8-\xf6\xf8-\xff\u0100-\u017f]/g,i=RegExp("[\\u0300-\\u036f\\ufe20-\\ufe23\\u20d0-\\u20f0]","g"),l="object"==typeof n.g&&n.g&&n.g.Object===Object&&n.g,a="object"==typeof self&&self&&self.Object===Object&&self,c=l||a||Function("return this")(),s=(o={À:"A",Á:"A",Â:"A",Ã:"A",Ä:"A",Å:"A",à:"a",á:"a",â:"a",ã:"a",ä:"a",å:"a",Ç:"C",ç:"c",Ð:"D",ð:"d",È:"E",É:"E",Ê:"E",Ë:"E",è:"e",é:"e",ê:"e",ë:"e",Ì:"I",Í:"I",Î:"I",Ï:"I",ì:"i",í:"i",î:"i",ï:"i",Ñ:"N",ñ:"n",Ò:"O",Ó:"O",Ô:"O",Õ:"O",Ö:"O",Ø:"O",ò:"o",ó:"o",ô:"o",õ:"o",ö:"o",ø:"o",Ù:"U",Ú:"U",Û:"U",Ü:"U",ù:"u",ú:"u",û:"u",ü:"u",Ý:"Y",ý:"y",ÿ:"y",Æ:"Ae",æ:"ae",Þ:"Th",þ:"th",ß:"ss",Ā:"A",Ă:"A",Ą:"A",ā:"a",ă:"a",ą:"a",Ć:"C",Ĉ:"C",Ċ:"C",Č:"C",ć:"c",ĉ:"c",ċ:"c",č:"c",Ď:"D",Đ:"D",ď:"d",đ:"d",Ē:"E",Ĕ:"E",Ė:"E",Ę:"E",Ě:"E",ē:"e",ĕ:"e",ė:"e",ę:"e",ě:"e",Ĝ:"G",Ğ:"G",Ġ:"G",Ģ:"G",ĝ:"g",ğ:"g",ġ:"g",ģ:"g",Ĥ:"H",Ħ:"H",ĥ:"h",ħ:"h",Ĩ:"I",Ī:"I",Ĭ:"I",Į:"I",İ:"I",ĩ:"i",ī:"i",ĭ:"i",į:"i",ı:"i",Ĵ:"J",ĵ:"j",Ķ:"K",ķ:"k",ĸ:"k",Ĺ:"L",Ļ:"L",Ľ:"L",Ŀ:"L",Ł:"L",ĺ:"l",ļ:"l",ľ:"l",ŀ:"l",ł:"l",Ń:"N",Ņ:"N",Ň:"N",Ŋ:"N",ń:"n",ņ:"n",ň:"n",ŋ:"n",Ō:"O",Ŏ:"O",Ő:"O",ō:"o",ŏ:"o",ő:"o",Ŕ:"R",Ŗ:"R",Ř:"R",ŕ:"r",ŗ:"r",ř:"r",Ś:"S",Ŝ:"S",Ş:"S",Š:"S",ś:"s",ŝ:"s",ş:"s",š:"s",Ţ:"T",Ť:"T",Ŧ:"T",ţ:"t",ť:"t",ŧ:"t",Ũ:"U",Ū:"U",Ŭ:"U",Ů:"U",Ű:"U",Ų:"U",ũ:"u",ū:"u",ŭ:"u",ů:"u",ű:"u",ų:"u",Ŵ:"W",ŵ:"w",Ŷ:"Y",ŷ:"y",Ÿ:"Y",Ź:"Z",Ż:"Z",Ž:"Z",ź:"z",ż:"z",ž:"z",Ĳ:"IJ",ĳ:"ij",Œ:"Oe",œ:"oe",ŉ:"'n",ſ:"ss"},function(t){return null==o?void 0:o[t]}),u=Object.prototype.toString,h=c.Symbol,d=h?h.prototype:void 0,f=d?d.toString:void 0;t.exports=function(t){var e;return(t=null==(e=t)?"":function(t){if("string"==typeof t)return t;if(function(t){return"symbol"==typeof t||function(t){return!!t&&"object"==typeof t}(t)&&"[object Symbol]"==u.call(t)}(t))return f?f.call(t):"";var e=t+"";return"0"==e&&1/t==-1/0?"-0":e}(e))&&t.replace(r,s).replace(i,"")}}},e={};function n(o){var r=e[o];if(void 0!==r)return r.exports;var i=e[o]={exports:{}};return t[o](i,i.exports,n),i.exports}n.n=t=>{var e=t&&t.__esModule?()=>t.default:()=>t;return n.d(e,{a:e}),e},n.d=(t,e)=>{for(var o in e)n.o(e,o)&&!n.o(t,o)&&Object.defineProperty(t,o,{enumerable:!0,get:e[o]})},n.g=function(){if("object"==typeof globalThis)return globalThis;try{return this||new Function("return this")()}catch(t){if("object"==typeof window)return window}}(),n.o=(t,e)=>Object.prototype.hasOwnProperty.call(t,e),(()=>{"use strict";n(363);var t=n(688),e=n.n(t);class o extends HTMLElement{connectedCallback(){this.listener=t=>{const n=t;this.shortcuts.filter((({baseKey:t,alt:o,shift:r,ctrl:i,meta:l})=>!(e()(n.key).toLowerCase()!==t.toLowerCase()||null!=o&&o!==n.altKey||null!=r&&r!==n.shiftKey||null!=i&&i!==n.ctrlKey||null!=l&&l!==n.metaKey))).map((({name:t})=>{n.preventDefault(),n.stopPropagation(),this.dispatchEvent(new CustomEvent("shortcut",{bubbles:!1,detail:{name:t,event:n}}))}))},document.body.addEventListener("keydown",this.listener,{capture:!0})}disconnectedCallback(){document.body.removeEventListener("keydown",this.listener,{capture:!0})}}customElements.define("shortcut-element",o);const r=localStorage.getItem("path");null!=r&&(localStorage.removeItem("path"),history.pushState({},"",r));const i=document.getElementById("root"),l=screen.width/i.clientWidth;Elm.Main.init({node:i,flags:{width:innerWidth,height:innerHeight,screenWidth:l,lang:localStorage.getItem("lang")||"en"}}).ports.setLang.subscribe((function(t){localStorage.setItem("lang",t),document.querySelector("html").setAttribute("lang",t)}));const a=document.querySelector(":root");let c=Math.round(parseFloat(getComputedStyle(a).getPropertyValue("font-size").slice(0,-2)));a.style.fontSize=c.toString()+"px"})()})();