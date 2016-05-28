angular.module 'turboGhost.posts', []
.controller 'PostsCtrl', ['$scope', '$routeParams', 'SETTINGS','ApiService', 'FirebaseService', ($scope, $routeParams, SETTINGS, ApiService, FirebaseService) ->
  
  $scope.settings = SETTINGS
  $scope.posts = []
  $scope.isLoading = true
  $scope.lastItem = null
  componentHandler.upgradeAllRegistered()
  $scope.currentPage = parseInt($routeParams.page || 1)
  perPage = 10

  FirebaseService.getCountOfPosts().once('value').then (snapshot) ->
    totalCount = snapshot.numChildren() 
    $scope.totalPages = parseInt(totalCount / perPage) + 1
    
  processData = (data) ->
    posts = []
    _.forIn(data.val(),(value, key)->
      item = _.merge(value, {slug: key})
      posts.push(item)
    )
    
    posts = _.sortBy(posts, 'published_at')
    posts = _.reverse(posts)
    return posts
  
  applyData = (posts) ->
    $scope.posts = posts
    $scope.isLoading = false
    $scope.$apply()
    
  readData = (postsRef, flag) ->
    postsRef.once('value').then (data) ->
      posts = processData(data)
      return applyData(posts) unless flag is true
      $scope.lastItem = _.last(posts).published_at
      FirebaseService.getPosts($scope.currentPage, $scope.lastItem, perPage).once('value').then (data) ->
        posts = processData(data)
        posts = _.tail(posts)
        applyData(posts)
          
    
  loadPosts = () ->
    if $scope.currentPage is 1
      postsRef = FirebaseService.getPosts($scope.currentPage,$scope.lastItem, perPage)
      readData(postsRef)
    else
      postsRef = FirebaseService.getPosts($scope.currentPage, $scope.lastItem, perPage)
      readData(postsRef, true)
    
    
  $scope.$watch('currentPage',(n,o)->
    return if n is null
    loadPosts()
  )
  
]
