angular.module 'turboGhost.article', []
.controller 'ArticleCtrl', [ '$routeParams','$scope', 'SETTINGS', 'FirebaseService', ($routeParams, $scope, SETTINGS, FirebaseService) ->
  $scope.post = {}
  $scope.settings = SETTINGS
  postSlug = $routeParams.post if $routeParams.post?
  
  loadPost = () ->
    postRef = FirebaseService.getPostBySlug(postSlug)
    postRef.once('value', (data)->
      $scope.post = data.val()
      _.merge($scope.post, { slug: postSlug })  
      $scope.$apply()
      $scope.$broadcast('loadedPost')
    )
    
  loadPost() 
  
]