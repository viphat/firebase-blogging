angular.module 'turboGhost.firebase', []
.service 'FirebaseService', [ ()->
  
  exportPosts = (posts) ->
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
    _.each(data, (item)->
      firebase.database().ref("tags/#{item.slug}").set(item.tags)
    )
    
  getPosts = (page, lastItem, pageSize) ->
    return firebase.database().ref('posts').orderByChild('published_at').limitToLast(pageSize) if page is 1
    if lastItem?
      return firebase.database().ref('posts').orderByChild('published_at').endAt(lastItem).limitToLast(pageSize+1)
    else
      itemsToFetch = (Math.abs(page - 1)) * pageSize
      return firebase.database().ref('posts').orderByChild('published_at').limitToLast(itemsToFetch)
     
  getTagsByPost = (post) ->
    firebase.database().ref("tags/#{post.slug}")
    
  getPostBySlug = (slug) ->
    firebase.database().ref("posts/#{slug}")
    
  getCountOfPosts = () ->
    firebase.database().ref("posts").orderByChild('status').equalTo('published')
    
  return {
    exportTags: exportTags 
    exportPosts: exportPosts
    getPosts: getPosts
    getTagsByPost: getTagsByPost
    getPostBySlug: getPostBySlug
    getCountOfPosts: getCountOfPosts
  }
  
]
