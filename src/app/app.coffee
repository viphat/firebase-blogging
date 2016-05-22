'use strict'

angular.module('turboGhost', [
  'ngRoute'
  'turboGhost.posts'
])
.config ($routeProvider) ->
  $routeProvider
  .when '/',
    controller: 'PostsCtrl'
    templateUrl: 'posts/posts.html'
  .otherwise
    redirectTo: '/'

