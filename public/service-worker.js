"use strict";var precacheConfig=[["/index.html","7a069cbfd23a775e32c35c58ca3e042e"],["/static/css/main.fa4c48b7.css","4862523fd91b6dba494ab1900e0cfd44"],["/static/js/main.e3d7b11e.js","daaee701904f432067684e3e2815a14a"],["/static/media/ApercuPro-Italic.4e202ee2.woff","4e202ee2af661ebf82ff485afca277be"],["/static/media/ApercuPro-Italic.779d13b3.eot","779d13b3c40f0b4496ee38375f56d84f"],["/static/media/ApercuPro-Italic.f44107c7.woff2","f44107c74c4970d1fac397879eea3e26"],["/static/media/ApercuPro-Medium.16dbccb1.eot","16dbccb11a19692c99a168ae45d78d53"],["/static/media/ApercuPro-Medium.ad2ae281.woff2","ad2ae28124b6b2d8b621070cad2142f2"],["/static/media/ApercuPro-Medium.b43a99b3.woff","b43a99b3cbe17b275857357b79622834"],["/static/media/ApercuPro.75b446c1.woff","75b446c1d7e088dca784d2a32bec6cf4"],["/static/media/ApercuPro.b4a3fc4e.woff2","b4a3fc4ed61f106fb0592b4fdbac3f1d"],["/static/media/ApercuPro.c5d11fb9.eot","c5d11fb976411d26d02f8f1cad9ac871"],["/static/media/dig_it.98b3133f.gif","98b3133f4ac8ae747bc6f4ea5ee4e8f7"],["/static/media/drag_button.46c6fb8e.gif","46c6fb8e6cdcaf66cd866147da1660f9"],["/static/media/gaussian.b643de40.svg","b643de40055b735ea610e3bb1dd80552"],["/static/media/logo.d396f12f.svg","d396f12fae7c345342e3e6fd23345a7b"]],cacheName="sw-precache-v3-sw-precache-webpack-plugin-"+(self.registration?self.registration.scope:""),ignoreUrlParametersMatching=[/^utm_/],addDirectoryIndex=function(e,t){var a=new URL(e);return"/"===a.pathname.slice(-1)&&(a.pathname+=t),a.toString()},cleanResponse=function(e){if(!e.redirected)return Promise.resolve(e);return("body"in e?Promise.resolve(e.body):e.blob()).then(function(t){return new Response(t,{headers:e.headers,status:e.status,statusText:e.statusText})})},createCacheKey=function(e,t,a,r){var n=new URL(e);return r&&n.pathname.match(r)||(n.search+=(n.search?"&":"")+encodeURIComponent(t)+"="+encodeURIComponent(a)),n.toString()},isPathWhitelisted=function(e,t){if(0===e.length)return!0;var a=new URL(t).pathname;return e.some(function(e){return a.match(e)})},stripIgnoredUrlParameters=function(e,t){var a=new URL(e);return a.hash="",a.search=a.search.slice(1).split("&").map(function(e){return e.split("=")}).filter(function(e){return t.every(function(t){return!t.test(e[0])})}).map(function(e){return e.join("=")}).join("&"),a.toString()},hashParamName="_sw-precache",urlsToCacheKeys=new Map(precacheConfig.map(function(e){var t=e[0],a=e[1],r=new URL(t,self.location),n=createCacheKey(r,hashParamName,a,/\.\w{8}\./);return[r.toString(),n]}));function setOfCachedUrls(e){return e.keys().then(function(e){return e.map(function(e){return e.url})}).then(function(e){return new Set(e)})}self.addEventListener("install",function(e){e.waitUntil(caches.open(cacheName).then(function(e){return setOfCachedUrls(e).then(function(t){return Promise.all(Array.from(urlsToCacheKeys.values()).map(function(a){if(!t.has(a)){var r=new Request(a,{credentials:"same-origin"});return fetch(r).then(function(t){if(!t.ok)throw new Error("Request for "+a+" returned a response with status "+t.status);return cleanResponse(t).then(function(t){return e.put(a,t)})})}}))})}).then(function(){return self.skipWaiting()}))}),self.addEventListener("activate",function(e){var t=new Set(urlsToCacheKeys.values());e.waitUntil(caches.open(cacheName).then(function(e){return e.keys().then(function(a){return Promise.all(a.map(function(a){if(!t.has(a.url))return e.delete(a)}))})}).then(function(){return self.clients.claim()}))}),self.addEventListener("fetch",function(e){if("GET"===e.request.method){var t,a=stripIgnoredUrlParameters(e.request.url,ignoreUrlParametersMatching),r="index.html";(t=urlsToCacheKeys.has(a))||(a=addDirectoryIndex(a,r),t=urlsToCacheKeys.has(a));var n="/index.html";!t&&"navigate"===e.request.mode&&isPathWhitelisted(["^(?!\\/__).*"],e.request.url)&&(a=new URL(n,self.location).toString(),t=urlsToCacheKeys.has(a)),t&&e.respondWith(caches.open(cacheName).then(function(e){return e.match(urlsToCacheKeys.get(a)).then(function(e){if(e)return e;throw Error("The cached response that was expected is missing.")})}).catch(function(t){return console.warn('Couldn\'t serve response for "%s" from cache: %O',e.request.url,t),fetch(e.request)}))}});