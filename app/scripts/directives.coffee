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
	directive('myPager', ['$timeout', '$compile',
	($timeout, $compile) ->
		restrict: 'E'
		priority: 0
		transclude: true
		template: '<div class="page-controls swiper-no-swiping">' +
			'<div class="control prev">&uarr;</div>' +
			'<div class="control next">&darr;</div>'+
			'</div>'
		link: (scope, elem, attrs) ->
			scope.goTo = (dir, pager, reset = false) ->
				parent = pager.parents('.slide-text-wrapper')
				content = parent.children('.text-body')
				pageHeight = do parent.height
				contentHeight = do content.height
				currentOffset = parseInt(content.css 'top')
				newOffset = if reset is true then 0 else currentOffset + dir*pageHeight - 10
				newOffset = Math.min(0, Math.max(newOffset, pageHeight-(contentHeight+15) ) )
				if newOffset != currentOffset
					content.animate
						'top': newOffset
			scope.reset = (pager) ->
				scope.goTo 1, pager, true
			scope.checkHeight = (pager) ->
				parent = pager.parents('.slide-text-wrapper')
				content = parent.children('.text-body')
				pageHeight = do parent.height
				contentHeight = do content.height
				if contentHeight >= pageHeight
					elem.hide()
				else
					elem.show()
			$timeout () ->				
				setTimeout () ->
					contentHeight = elem.parents('.slide-text-wrapper').children('.text-body').height()
				, 2000
				$this = angular.element('.control:not(.processed)')
				$this.addClass('processed').click () ->
					if($(this).hasClass('next')) 
						scope.goTo -1, $(this) 
					else 
						scope.goTo 1, $(this)
				$this.bind('reset', () ->
					scope.reset $(this)
				)
			, 2000
	]).
	directive("myInfo", [
		() ->
			transclude: false
			scope:
				info: "=myInfo"
			templateUrl: "views/info.html"
	]).
	directive("myBios", [
		() ->
			scope:
				bios: "=myBios"
			templateUrl: "views/bio.html"
			
	])