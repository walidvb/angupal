angular.module('myApp').
	filter('notFirst', () ->
		(input) ->
			if input and input isnt "undefined"
			    array = new Array()
			    i = 1
			    while i < input.length
			      array.push input[i++]
			      
			    return array			
	).
	filter('first', () ->
		(input) ->
			if input and input isnt "undefined"
			    return input[0]			
	).
	directive("myProject", [
		  () ->  
		      scope:
		        project: "=myProject"
		      templateUrl: "views/project.html"
		      replace: true
		  
	]).
	directive('myMultipage', ['$timeout'
		($timeout) ->
			priority: 300
			controller: ($scope) ->
				$scope.next = () ->
					goTo 'next'
				$scope.prev = () ->
					goTo 'prev'
				goTo = (direction) ->
					h = $scope.page.height()
					console.log 'page', $scope.page
					newOffset = if direction is 'next' then $scope.pageOffset-h else $scope.pageOffset+h
					newOffset += 10
					page = $scope.page.find('.html-content')
					console.log 'newOffset', newOffset, 'h', h, 'page.height', page.height()
					if newOffset > 0  
						newOffset = 0
						return
					if -newOffset > page.height() 
						newOffset = $scope.pageOffset
						return
					page.animate(
							'opacity': 0, 
						'ease-out', ()->
							$(this).css({
								'-webkit-transform' : 'translateY('+newOffset+'px)'
								'-moz-transform' : 'translateY('+newOffset+'px)'
								'transform' : 'translateY('+newOffset+'px)'
							})
							page.stop().animate(
								'opacity': 1, 
							'ease-out');
					)
					$scope.pageOffset = newOffset
					$scope.pageIndex = if direction is 'next' then $scope.pageIndex++ else $scope.pageIndex--
			# Runs during compile
			link: (scope, elm, attrs) ->
					scope.page = angular.element(elm)
					#console.log 'page height', scope.page.height(), 'content height', scope.page.find('.html-content').height()
					if scope.page.height() <= scope.page.find('.html-content').height()
						scope.pageIndex = null
						return
					# Runs during render
					prev = angular.element('<div class="control prev"/>').html('&uarr;')
					next = angular.element('<div class="control next"/>').html('&darr;')
					controls = angular.element('<div class="page-controls">').append(prev).append(next)
					angular.element(elm).append controls

					
					next.bind 'click', () ->
						console.log 'clicked next'
						scope.next();
					
					
					prev.bind 'click', () ->
						console.log 'clicked prev'
						scope.prev();

					scope.controls = 
						prev: prev
						next: next
					scope.pageOffset = 0
					scope.pageIndex = 0
	]).
	directive("myInfo", [
		() ->
			transclude: false
			scope:
				info: "=myInfo"
			templateUrl: "views/info.html"
			link: (scope, elem, attrs) ->  
				console.log scope, elem, attrs

	]).
	directive("myBios", [
		() ->
			scope:
				bios: "=myBios"
			templateUrl: "views/bio.html"
			
	])