angular.module 'turboGhost.firebase', []
.service 'FirebaseService', [ ()->
  
  exportPosts = (posts) ->
    # firebase = ConnectionService.initialize()
    _.each(posts, (post)->
      firebase.database().ref("posts/#{post.slug}").set({
        title: post.title,
        content: post.content,
        status: post.status,
        visibility: post.visibility,
        created_at: post.created_at,
        updated_at: post.updated_at,
        published_at: post.published_at
      })
    )
    
  exportTags = (data) ->
    # firebase = ConnectionService.initialize()
    _.each(data, (item)->
      firebase.database().ref("tags/#{item.slug}").set(item.tags)
    )
    
  getPosts = () ->
    # firebase = ConnectionService.initialize()
    firebase.database().ref('posts').orderByChild('published_at').limitToLast(5)
    
  getTagsByPost = (post) ->
    firebase.database().ref("tags/#{post.slug}")
    
  getPostBySlug = (slug) ->
    firebase.database().ref("posts/#{slug}")
    
    
  return {
    exportTags: exportTags 
    exportPosts: exportPosts
    getPosts: getPosts
    getTagsByPost: getTagsByPost
    getPostBySlug: getPostBySlug
  }
  
]
