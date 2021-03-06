'use strict'

angular.module('turboGhost', [
  'ngRoute'
  'ngSanitize'
  'turboGhost.layouts'
  'turboGhost.posts'
  'turboGhost.article'
  'turboGhost.firebase'
  'turboGhost.api'
  'hc.marked'
  'angularSmoothscroll'
])
.constant('SETTINGS',{
  siteUrl: "/#/"
  siteLogo: "https://s3-ap-southeast-1.amazonaws.com/viphat.work/blog/avatar-ninja.png"
  coverPhoto: "https://s3-ap-southeast-1.amazonaws.com/viphat.work/blog/bg.png"
})
.run([ ()->
  config = {
    apiKey: "AIzaSyAiEZ28WwK3ovWm1_rJjpqpGVxwznjPKtg",
    authDomain: "fireblog-36a95.firebaseapp.com",
    databaseURL: "https://fireblog-36a95.firebaseio.com",
    storageBucket: "fireblog-36a95.appspot.com"
  }
  firebase.initializeApp(config)
])
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
  .when '/:post',
    controller: 'ArticleCtrl'
    templateUrl: 'article/article.html'
  .when '/pages/:page',
    controller: 'PostsCtrl'
    templateUrl: 'posts/posts.html'
  .when '/',
    controller: 'PostsCtrl'
    templateUrl: 'posts/posts.html'
  .otherwise
    redirectTo: '/'
])
