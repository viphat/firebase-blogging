'use strict'

angular.module('turboGhost', [
  'ngRoute'
  'turboGhost.posts'
  'turboGhost.firebase'
  'turboGhost.api'
])
.constant('SETTINGS',{
  siteUrl: "http://notes.viphat.work"
  siteLogo: "https://s3-ap-southeast-1.amazonaws.com/viphat.work/blog/avatar-ninja.png"
  coverPhoto: "https://s3-ap-southeast-1.amazonaws.com/viphat.work/blog/bg.png"
})
.config ($routeProvider) ->
  $routeProvider
  .when '/',
    controller: 'PostsCtrl'
    templateUrl: 'posts/posts.html'
  .otherwise
    redirectTo: '/'

