angular.module 'turboGhost.posts'
.directive 'post', [ () ->
  restrict: 'E'
  scope: {
    post: "="
  }
  templateUrl: "posts/post.html"
  controller: [ '$scope', ($scope)->
    
    
    
    
  ]
]