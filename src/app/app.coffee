'use strict'

angular.module('turboGhost', [
  'ngRoute'
  'turboGhost.posts'
  'turboGhost.firebase'
  'turboGhost.api'
  'hc.marked'
])
.constant('SETTINGS',{
  siteUrl: "http://notes.viphat.work"
  siteLogo: "https://s3-ap-southeast-1.amazonaws.com/viphat.work/blog/avatar-ninja.png"
  coverPhoto: "https://s3-ap-southeast-1.amazonaws.com/viphat.work/blog/bg.png"
})

.config(['markedProvider', (markedProvider) ->
  markedProvider.setOptions({
   gfm: true,
   tables: true,
   highlight: (code, lang) ->
    if (lang)
      hljs.highlight(lang, code, true).value
    else
      hljs.highlightAuto(code).value
  })
])
.config(['$routeProvider', ($routeProvider) ->
  $routeProvider
  .when '/',
    controller: 'PostsCtrl'
    templateUrl: 'posts/posts.html'
  .otherwise
    redirectTo: '/'
])

