angular.module('myApp').
	filter('notFirst', () ->
		(input) ->
			if input and input isnt "undefined"
			    array = new Array()
			    i = 1
			    while i < input.length
			      array.push input[i]
			      i++
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
		      contrsoller: ($scope) ->
		      		$scope.$watchCollection($scope.project, () ->
				      	$scope.project.first = $scope.project.imgs.splice(0, 1)[0]
				     	)
		      replace: true
		      templateUrl: "sites/all/themes/angupal/app/views/project.html"
		  
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
					#newOffset += 3
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
					$scope.pageIndex = if direction is 'next' then $scope.pageIndex+1 else $scope.pageIndex-1
			# Runs during compile
			link: (scope, elm, attrs) ->
					scope.page = angular.element(elm)
					console.log 'page height', scope.page.height(), 'content height', scope.page.find('.html-content').height()
					console.log scope.page.find('.html-content')
					if scope.page.height() <= scope.page.find('.html-content').height()
						scope.pageIndex = null
						return
					# Runs during render
					next = angular.element('<div class="control next"/>').text('+').bind('click', () ->
						scope.next();
					)
					prev = angular.element('<div class="control prev"/>').text('-').bind('click', () ->
						scope.prev();
					)
					controls = angular.element('<div class="page-controls">').append(prev).append(next)
					angular.element(elm).append controls
					
					scope.controls = 
						prev: prev
						next: next
					scope.pageOffset = 0
					scope.pageIndex = 0
	]).
	directive("myBio", [
		() ->
			scope:
				bio: "=myBio"
			templateUrl: "sites/all/themes/angupal/app/views/bio.html"
	]).
	directive("swiperSlide", [ 
		() ->
			link: (scope, elem, attrs) ->
				console.log 'Swiper slide', scope, elem
	]).
	directive("swiper", ['$timeout'
		($timeout) ->
			priority: 500
			link: (scope, elem, attrs) ->
				$timeout(() ->
					$this = angular.element elem
					options = 
						mousewheelControl: true
						mousewheelControlForceToAxis: true
						keyboardControl: true
						resizeReInit: true
						grabCursor: true

					if attrs.swiper == 'vert'
						initialState = true
						#Create and Add pagers to the dom
						pagination = $ '<div class="vert-pagination"/>'
						scope.swipers.vertPagination = pagination
						angular.element('navigation').prepend pagination
						options.slideClass             = 'slide-vert'
						options.mode                   = 'vertical'
						options.pagination             = '.vert-pagination'
						options.paginationElement      = 'div'
						options.paginationElementClass = 'vert-pager'
						options.paginationActiveClass  = 'active'
						options.paginationVisibleClass = 'visible'
						options.paginationClickable    = true
						options.initialSlide	= 1
						options.onSwiperCreated = (swiper) ->
							#move pagination to center
							angular.element('navigation').css 'marginTop', -pagination.height()/2
							scope.initPagers()
						options.onSlideChangeStart = (swiper, direction) ->
							angular.element('body').removeClass 'initial-state'
							pagination.removeClass 'faded'
							scope.initPagers()
						options.onSlideChangeEnd = (swiper, direction) ->
							if initialState
								swiper.removeSlide 0
								swiper.swipeTo(0, 0, false)
								angular.element('body').addClass 'ready-state'
								initialState = false
							scope.initPagers()
							
						scope.swipers.vertical = $this.swiper(options)
						return
					else
						options.slideClass = 'slide-horz'
						options.onSlideChangeStart = () ->
							angular.element('.vert-pagination').addClass 'faded'
					if attrs.id == 'bio'
						if window.innerWidth > 767
							options.slidesPerView = 2
					$this.swiper(options)
				, 1000)
	])