angular.module 'turboGhost.posts'
.directive 'post', ['FirebaseService', (FirebaseService) ->
  restrict: 'E'
  scope: {
    post: "="
    showToc: "="
  }
  templateUrl: "posts/post.html"
  controller: [ '$scope', 'marked','$sce', ($scope, marked, $sce)->
    
    $scope.isLoading = true
    componentHandler.upgradeAllRegistered()
    
    initPost = () ->
      return unless $scope.post.content?
      shortContent = if $scope.post.excerpt? then $scope.post.excerpt else $scope.post.content
      $scope.tags = []
      htmlContent = marked(shortContent)
      htmlContent = $sce.trustAsHtml(htmlContent)
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
        $scope.isLoading = false
        $scope.$apply()
      
    $scope.$on('loadedPost',(event,arg)->
      initPost()
    )
    
    initPost()
    
  ]
]