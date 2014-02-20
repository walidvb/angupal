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
	]).
	directive("swiper", ['$timeout'
		($timeout) ->
			controller: ($scope) ->
				$scope.horizontal = new Array
			priority: 500
			link: (scope, elem, attrs) ->
				$timeout(() ->
					console.log attrs.swiper, angular.element elem
					options = 
						mousewheelControl: true
						mousewheelControlForceToAxis: true
						keyboardControl: true
						resizeReInit: true
						grabCursor: true
					if attrs.swiper == 'vert'
						options.slideClass = 'slide-vert'
						options.mode = 'vertical'
						$this = angular.element elem
						scope.vertical = $this.swiper options
						return
					else
						options.slideClass = 'slide-horz'
						$this = angular.element elem
					if attrs.settings == 'bio'
						options.scrollContainer =  true
					scope.horizontal.push $this.swiper(options)
				, 1000)
	])