angular.module 'turboGhost.posts', []
.controller 'PostsCtrl', ['$scope', 'SETTINGS', 'ApiService', 'FirebaseService', ($scope, SETTINGS, ApiService, FirebaseService) ->
  
  $scope.settings = SETTINGS
  $scope.posts = []
  $scope.isLoading = true
  componentHandler.upgradeAllRegistered()

  loadPosts = () ->
    postsRef = FirebaseService.getPosts()
    postsRef.once('value').then (data) ->
      $scope.posts = []
      _.forIn(data.val(),(value, key)->
        item = _.merge(value, {slug: key})
        $scope.posts.push(item)
      )
      $scope.posts = _.sortBy($scope.posts, 'published_at')
      $scope.posts = _.reverse($scope.posts)
      $scope.isLoading = false
      $scope.$apply()
    
  loadPosts()
  
]
