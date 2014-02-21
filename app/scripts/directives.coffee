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
						options.initialSlide	= 2
						options.onSwiperCreated = (swiper) ->
							#move pagination to center
							angular.element('navigation').css 'marginTop', -pagination.height()/2
							scope.initPagers()
						options.onSlideChangeStart = (swiper, direction) ->
							angular.element('body').removeClass 'initial-state'
							pagination.removeClass 'faded'
							console.log 'startChange'
							scope.initPagers()
						options.onSlideChangeEnd = (swiper, direction) ->
							if initialState
								swiper.removeSlide 0
								swiper.swipeTo(0, 0, false)
								angular.element('body').addClass 'ready-state'
								initialState = false
							console.log 'endChange'
							scope.initPagers()
							
						scope.swipers.vertical = $this.swiper(options)
						return
					else
						options.slideClass = 'slide-horz'
						options.onSlideChangeStart = () ->
							angular.element('.vert-pagination').addClass 'faded'
					if attrs.id == 'bio'
						console.log 'h'
						if window.innerWidth > 767
							options.slidesPerView = 2
					$this.swiper(options)

				, 1000)
	])