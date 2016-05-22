angular.module 'turboGhost.posts'
.controller 'PostsCtrl',['$scope',($scope) ->
  $scope.settings =
    siteUrl: "http://notes.viphat.work"
    siteLogo: "https://s3-ap-southeast-1.amazonaws.com/viphat.work/blog/avatar-ninja.png"
    coverPhoto: "https://s3-ap-southeast-1.amazonaws.com/viphat.work/blog/bg.png"
]
