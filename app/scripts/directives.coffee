angular.module('myApp').
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
	