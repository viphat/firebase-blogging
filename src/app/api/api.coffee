angular.module 'turboGhost.api', []
.service 'ApiService', [ '$http', ($http)->
  
  baseUrl = 'http://localhost:3001'
  
  getTags = () ->
    $http.get("#{baseUrl}/tags/get_tags.json")
      
    
  getPosts = () ->
    $http.get("#{baseUrl}/posts/get_posts.json")
  
  return {
    getPosts: getPosts    
    getTags: getTags
  }
  
]
