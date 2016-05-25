angular.module 'turboGhost.firebase', []
.service 'FirebaseService', [ ()->
  
  initialize = () ->
    # Initialize Firebase
    config = {
      apiKey: "AIzaSyAiEZ28WwK3ovWm1_rJjpqpGVxwznjPKtg",
      authDomain: "fireblog-36a95.firebaseapp.com",
      databaseURL: "https://fireblog-36a95.firebaseio.com",
      storageBucket: "fireblog-36a95.appspot.com"
    }
    firebase.initializeApp(config)
    return firebase
  
  writePosts = (posts) ->
    firebase = initialize()
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
    
  writeTags = (tags) ->
    firebase = initialize()
    _.each(tags, (tag)->
      firebase.database().ref("tags/#{tag.slug}").set({
        name: tag.name
        posts: tag.posts 
      })
    )
    
  getPosts = () ->
    firebase = initialize()
    firebase.database().ref('posts').orderByChild('published_at').limitToLast(5)
  
    
  return {
    initialize: initialize
    writeTags: writeTags 
    writePosts: writePosts
    getPosts: getPosts
  }
  
]
