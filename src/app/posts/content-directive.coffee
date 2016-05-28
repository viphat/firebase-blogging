angular.module 'turboGhost.posts'
.directive 'content', ['$location','$anchorScroll', ($location, $anchorScroll ) ->
  restrict: 'E'
  scope: {
    content: "="
  }
  templateUrl: "posts/content.html"
  link: ($scope, $element, $attrs) ->
    $scope.showTOC = false
    $scope.items = []
    
    $scope.scrollTo = (id, $event) ->
      # Basic Angular Scroll
      old = $location.hash()
      $event.preventDefault()
      $event.stopPropagation()
      $location.hash(id)
      $anchorScroll()
      $location.hash(old)
    
    insertTOC = () ->
      return if $element.find("h3").length < 3
      $scope.showTOC = true
      index = 1
      angular.forEach($element.find("h3"), (value,key)->
        h3 = angular.element(value)
        text = h3[0].innerText
        h3.html("<a id='anchor-#{index}'>#{text}</a>")
        $scope.items.push({
          text: text
          anchor: "anchor-#{index}"
        })
        index += 1
      )
      
        
    $scope.$watch('content', (n,o)->
      return if n is undefined
      insertTOC()
    )
    
    

]