angular.module('myApp')
	.directive 'swiperCtrl', () ->
			mySwiper = new Array
			obj = 
				priority: 1000
				controller: ($scope, $attrs, $timeout) ->
					$this = this
					$this.initialState = true
					
					$this.initPagers = () ->
						slideNames = new Array
						slideNames.push pager.attributes['data-name'].value for pager in angular.element '.slide-vert'
						slideIcons = new Array
						slideIcons.push pager.attributes['data-icon'].value for pager in angular.element '.slide-vert'
						pagination =  angular.element('.vert-pagination')
						pagers = pagination.find 'div.vert-pager'
							
						for item, i in pagers
							title = #angular.element('<div class="title">'+slideNames[i]+'</div>')
							$item = angular.element(item)
							icon = 
								img: angular.element('<img class="icon" src="'+slideIcons[i]+'"/>')
								item: $item

							$item
								.attr('data-title', slideNames[i])
								.append  icon.img
							$item.bind 'click', () ->
								this.click()
								$scope.navOpen = false
								$scope.infoOpen = false
								do $scope.$digest
					$this.ready = () ->
						#if mySwiper then do mySwiper.reInit 
						#else

						$thisSwiper   = $attrs.$$element
						options = 
							mousewheelControl: true
							mousewheelControlForceToAxis: true
							keyboardControl: true
							resizeReInit: true
							grabCursor: true
							longSwipesRatio: 0.1
							calculateHeight: false
						#if vertical
						if $attrs.swiperCtrl is 'vert'
							#Create and Add pagers to the dom
							pagination = $ '<div class="vert-pagination"/>'
							
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
							options.onSlideChangeStart = (swiper, direction) ->
								angular.element('body').removeClass 'initial-state'
								pagination.removeClass 'faded'
							options.onSlideChangeEnd = (swiper, direction) ->
								if $this.initialState
									swiper.removeSlide 0
									swiper.swipeTo(0, 0, false)
									angular.element('body').addClass 'ready-state'
									$this.initialState = false
									do swiper.reInit
									do $this.initPagers
							$timeout () ->
								mySwiper.push $thisSwiper.swiper(options)
								do $this.initPagers
						# if horizontal
						else
							#horizontal
							options.slideClass = 'slide-horz'
							options.loop = true	
							if $attrs.id == 'bio' and window.innerWidth > 767
								options.slidesPerView = 2	

							$timeout () ->
								mySwiper.push $thisSwiper.swiper(options)
					return $this						
			return obj
	.directive 'swiperSlide', () ->
		dirobj = 
			require: '^swiperCtrl'
			compile: ()->
				post: (scope, elem, attrs, swiperCtrl) ->
					do swiperCtrl.ready if scope.$last or attrs.swiperSlide is 'last'
		return dirobj