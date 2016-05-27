angular.module 'turboGhost.posts'
.directive 'post', ['FirebaseService', (FirebaseService) ->
  restrict: 'E'
  scope: {
    post: "="
  }
  templateUrl: "posts/post.html"
  controller: [ '$scope', 'marked', ($scope, marked)->
    
    initPost = () ->
      return unless $scope.post.content?
      shortContent = if $scope.post.excerpt? then $scope.post.excerpt else $scope.post.content
      $scope.tags = []
      htmlContent = marked(shortContent)
      _.merge($scope.post, { 
        shortContent: shortContent
        htmlContent: htmlContent
      })
      tagsRef = FirebaseService.getTagsByPost($scope.post)
      tagsRef.once('value').then (data) ->
        _.forIn(data.val(), (value, key)->
          $scope.tags.push({ 
            slug: key
            name: value.split(" ").join(" ")
          })
        )
        $scope.$apply()
      
    $scope.$on('loadedPost',(event,arg)->
      initPost()
    )
    
    initPost()
    
  ]
]