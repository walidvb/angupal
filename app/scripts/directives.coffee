angular.module('myApp').
	directive('drupalEdit', ['drupal', (backend) ->
		if not backend.user and not true
			replace: true
			template: '<span>no edit</span>'
		else
			scope: 
				nid: "=drupalEdit"
			replace : true
			template: '<a class="edit" ng-href="' + base_path + 'node/{{nid}}/edit" target="_blank"><span class="glyphicon glyphicon-edit" data-toggle="tooltip" data-title="Edit"></span></a>'
			link: (scope, elem, attrs) ->
				console.log elem
				elem[0].parentNode.classList.add 'editable'
		]).
	directive("myHtml", [
		  "$timeout"
		  "$sce"
		  (timer, $sce) ->
		    return (
		      scope:
		        myHtml: "="
	
		      replace: true
		      template: "<span ng-bind-html='trustMe(myHtml)'></span>"
		      controller: ($scope, $element) ->
		        $scope.trustMe = (html) ->
		          $sce.trustAsHtml html
	
		        return
		    )
		]).
	directive("myFullscreen", [ "$timeout", "$window", (timer, $window) ->
  	(scope, elem, attrs) ->
      setSize = ->
        menu_height = (if attrs.myFullscreen then 0 else angular.element("#menu").height())
        angular.element(elem).height($window.innerHeight - menu_height).css "overflow", "auto"
      angular.element($window).bind "resize", ->
        setSize()
      timer setSize, 0
 	]).
	directive("myProject", [
		  () ->  
		      scope:
		        project: "=myProject"
	
		      replace: true
		      templateUrl: "views/project.html"
		  
		]).
	directive("myBio", [
		() ->
			scope:
				bio: "=myBio"
			templateUrl: "views/bio.html"
		])