angular.module 'turboGhost.posts'
.controller 'PostsCtrl', ['$scope', 'ApiService', 'FirebaseService', ($scope, ApiService, FirebaseService) ->
  
  # ApiService.getTags().then (res) ->
  #   FirebaseService.writeTags(res.data.tags)
  
  ApiService.getPosts().then (res) ->
    FirebaseService.writePosts(res.data.posts)
  
  $scope.settings =
    siteUrl: "http://notes.viphat.work"
    siteLogo: "https://s3-ap-southeast-1.amazonaws.com/viphat.work/blog/avatar-ninja.png"
    coverPhoto: "https://s3-ap-southeast-1.amazonaws.com/viphat.work/blog/bg.png"
]
