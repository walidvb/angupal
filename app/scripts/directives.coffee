angular.module('myApp').
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
	directive("myProject", [
		  () ->  
		      scope:
		        project: "=myProject"
	
		      replace: true
		      templateUrl: "views/project.html"
		  
		])
