angular.module 'turboGhost.posts'
.directive 'content', ['$location','$anchorScroll', ($location, $anchorScroll ) ->
  restrict: 'E'
  scope: {
    content: "="
    showToc: "="
  }
  templateUrl: "posts/content.html"
  link: ($scope, $element, $attrs) ->
    $scope.showTOC = false
    $scope.items = []
    
    $scope.scrollTo = (id, $event) ->
      # Basic Angular scrollTo
      old = $location.hash()
      $event.preventDefault()
      $event.stopPropagation()
      $location.hash(id)
      $anchorScroll()
      $location.hash(old)
    
    insertTOC = () ->
      return unless $scope.showToc?
      return if $element.find("h4").length < 2
      $scope.showTOC = true
      # jQuery Version
      $("h4,h5,h6").each((index, value)->
        text = $(this)[0].innerText
        $(this).html("<a id='anchor-#{index}'>#{text}</a>")
        iClass = if $(this)[0].localName is "h4" then "first" else if $(this)[0].localName is "h5" then "second" else "third"
        $scope.items.push({
          text: text.split(' ').join(' ')
          anchor: "anchor-#{index}"
          iClass: iClass
        })
      )
      return 
      # Angular Version
      # index = 1      
      # angular.forEach($element.find("h4"), (value,key)->
      #   tag = angular.element(value)
      #   text = tag[0].innerText
      #   tag.html("<a id='anchor-#{index}'>#{text}</a>")
      #   $scope.items.push({
      #     text: text.split(' ').join(' ')
      #     anchor: "anchor-#{index}"
      #   })
      #   index += 1
      # )
      
        
    $scope.$watch('content', (n,o)->
      return if n is undefined
      insertTOC()
    )
    
    

]