'use strict'

angular.module('turboGhost', [
  'ngRoute'
  'turboGhost.posts'
  'turboGhost.firebase'
  'turboGhost.api'
])
.config ($routeProvider) ->
  $routeProvider
  .when '/',
    controller: 'PostsCtrl'
    templateUrl: 'posts/posts.html'
  .otherwise
    redirectTo: '/'

