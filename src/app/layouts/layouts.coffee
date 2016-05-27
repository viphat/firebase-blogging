angular.module 'turboGhost.layouts', []
.directive 'turboFooter', [ ()->
  restrict: 'E'
  templateUrl: 'layouts/footer.html'
  scope: false
  link: ($scope, $ele, $attrs) ->
    return
  
]