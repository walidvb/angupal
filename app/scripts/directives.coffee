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
				$scope.pagination = null
			priority: 500
			link: ($scope, elem, attrs) ->
				$timeout(() ->
					$this = angular.element elem
					options = 
						mousewheelControl: true
						mousewheelControlForceToAxis: true
						keyboardControl: true
						resizeReInit: true
						grabCursor: true

					if attrs.swiper == 'vert'
						#Create and Add pagers to the dom
						pagination = angular.element '<div class="vert-pagination"/>'
						$scope.pagination = pagination
						$this.append pagination
						options.slideClass             = 'slide-vert'
						options.mode                   = 'vertical'
						options.pagination             = '.vert-pagination'
						options.paginationElement      = 'div'
						options.paginationElementClass = 'vert-pager'
						options.paginationActiveClass  = 'active'
						options.paginationVisibleClass = 'visible'
						options.paginationClickable    = true		
						options.onSwiperCreated = (swiper) ->
							# add info
							info = angular.element '#info'
							pagination.append info
							#move pagination to center
							pagination.css 'marginTop', -pagination.height()/2

						# remove first item and change color to white
						options.onSlideChangeStart = (swiper, direction) ->
							angular.element('body').removeClass 'initial-state'
							pagination.removeClass 'faded'
						options.onSlideChangeEnd = (swiper, direction) ->
							swiper.removeSlide 0
							swiper.swipeTo(0, 0, false)
							angular.element('body').addClass 'ready-state'

							swiper.removeCallbacks 'SlideChangeEnd'


						$scope.vertical = $this.swiper(options)
						
						return
					else
						options.slideClass = 'slide-horz'
						options.onSlideChangeStart = () ->
							angular.element('.vert-pagination').addClass 'faded'
					if attrs.settings == 'bio'
						options.scrollContainer =  true
					$scope.horizontal.push $this.swiper(options)
				, 1000)
	])