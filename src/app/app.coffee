angular.module('turboGhost', [
  'ngRoute'
  'turboGhost.todo'
])
.config ($routeProvider) ->
  'use strict'
  $routeProvider
    .when '/todo',
      controller: 'TodoCtrl'
      templateUrl: '/turbo-ghost/todo/todo.html'
    .otherwise
      redirectTo: '/todo'

