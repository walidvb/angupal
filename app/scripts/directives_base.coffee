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
				elem[0].parentNode.classList.add 'editable'
		]).
	directive("myHtml", [
		  "$timeout"
		  "$sce"
		  (timer, $sce) ->
		    return (
		      scope:
		        myHtml: "="
		      replace: false
		      priority: 1000
		      template: "<span ng-bind-html='trustMe(myHtml)' class='html-content'></span>"
		      controller: ($scope, $element) ->
		        $scope.trustMe = (html) ->
		          $sce.trustAsHtml html
	
		        return
		    )
		]).
	directive("myaFullscreen", [ "$timeout", "$window", (timer, $window) ->
  	(scope, elem, attrs) ->
      setSize = ->
        menu_height = (if attrs.myFullscreen then 0 else angular.element("#menu").height())
        if attrs.myFullscreen == 'y' 
        	angular.element(elem).css
        		height: $window.innerHeight
        		# TODO
        		overflowY: 'hidden'
        else
        	angular.element(elem).width(angular.element('.container').innerWidth)

      angular.element($window).bind "resize", ->
        setSize()
      timer setSize, 0
 	])
 	.filter 'trust', ['$sce', ($sce) ->
		 (input) ->
				$sce.trustAsHtml(input);
	]