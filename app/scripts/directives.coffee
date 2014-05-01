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
			scope.goTo = (dir, pager) ->
				console.log 'scope.goTo ' + dir
				parent = pager.parents('.slide-text-wrapper')
				content = parent.children('.text-body')
				pageHeight = do parent.height
				contentHeight = do content.height
				currentOffset = parseInt(content.css 'top')
				newOffset = currentOffset + dir*pageHeight - 10
				newOffset = Math.min(0, Math.max(newOffset, pageHeight-(contentHeight+15) ) )
				if newOffset != currentOffset
					content.animate
						'top': newOffset

			$timeout () ->
				console.log 'compiled'
				
				setTimeout () ->
					contentHeight = elem.parents('.slide-text-wrapper').children('.text-body').height()
					console.log elem.parents('.slide-text-wrapper').children('.text-body').height(), 'contentHeight', contentHeight
				, 2000
				angular.element('.control:not(.processed)').addClass('processed').click () ->
					if($(this).hasClass('next')) 
						scope.goTo -1, $(this) 
					else 
						scope.goTo 1, $(this)
					console.log 'clicked'
			, 4000
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