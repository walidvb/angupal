angular.module('myApp')
	.directive 'swiperCtrl', () ->
			mySwiper = null
			id = 1
			obj = 
				priority: 1000
				controller: () ->
					this.ready = () ->
						do mySwiper.reInit

					return this
				compile: () ->
					pre: (scope, elem, attrs) ->
						$this   = elem
						options = 
							mousewheelControl: true
							mousewheelControlForceToAxis: true
							keyboardControl: true
							resizeReInit: true
							grabCursor: true
							longSwipesRatio: 0.1
							
						#if vertical
						if attrs.swiperCtrl is 'vert'
							#Create and Add pagers to the dom
							pagination = $ '<div class="vert-pagination"/>'
							scope.swipers.vertPagination = pagination
							angular.element('.pagination-wrapper').prepend pagination
							options.slideClass             = 'slide-vert'
							options.mode                   = 'vertical'
							options.pagination             = '.vert-pagination'
							options.paginationElement      = 'div'
							options.paginationElementClass = 'vert-pager'
							options.paginationActiveClass  = 'active'
							options.paginationVisibleClass = 'visible'
							options.paginationClickable    = true
							options.initialSlide           = 0
							options.onSwiperCreated = (swiper) ->
								#move pagination to center
								angular.element('.vert-pagination').css 'marginTop', -pagination.height()/2
								scope.initPagers()
							options.onSlideChangeStart = (swiper, direction) ->
								angular.element('body').removeClass 'initial-state'
								pagination.removeClass 'faded'
							options.onSlideChangeEnd = (swiper, direction) ->
								if initialState
									swiper.removeSlide 0
									swiper.swipeTo(0, 0, false)
									angular.element('body').addClass 'ready-state'
									initialState = false
									scope.initPagers()	
							mySwiper = $this.swiper(options)
						# if horizontal
						else
							#horizontal
							options.loop       = true
							options.slideClass = 'slide-horz'
							options.onSlideClick = (swiper) ->
								do swiper.swipeNext
							options.aonSlideTouch = (swiper) ->
								do swiper.swipeNext
							options.aonSlideChangeStart = (swiper, direction) ->
								console.log 'horizontal change ', swiper	
							if attrs.id == 'bio' and window.innerWidth > 767
								options.slidesPerView = 2	

							setTimeout( () ->
								mySwiper           = $this.swiper(options)
								console.log 'swiper horz instantiated'
							, 2000)
			return obj
	.directive 'swiperSlide', () ->
		dirobj = 
			require: '^swiperCtrl'
			#called IFF compile not defined
			compile: ()->
				post: (scope, elem, attrs, swiperCtrl) ->
					#register DOM listeners or update DOM
					console.log swiperCtrl
					do swiperCtrl.ready if scope.$last or attrs.swiperSlide is 'last'
		return dirobj