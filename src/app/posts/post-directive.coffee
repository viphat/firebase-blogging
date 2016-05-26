angular.module 'turboGhost.posts'
.directive 'post', ['FirebaseService', (FirebaseService) ->
  restrict: 'E'
  scope: {
    post: "="
  }
  templateUrl: "posts/post.html"
  controller: [ '$scope', ($scope)->
    shortContent = if $scope.post.excerpt? then $scope.post.excerpt else $scope.post.content
    $scope.tags = []
    $scope.post = _.merge($scope.post, { shortContent: shortContent }) 
    
    getPostTags = () ->
      tagsRef = FirebaseService.getTagsByPost($scope.post)
      tagsRef.once('value').then (data) ->
        $scope.tags = []
        _.forIn(data.val(), (value, key)->
          $scope.tags.push { 
            slug: key
            name: value.split(" ").join(" ")
          }
        )
        $scope.$apply()
      
    getPostTags()
    
  ]
]