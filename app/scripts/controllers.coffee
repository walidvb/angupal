'use strict'
angular.module('myApp')
	.filter('first', (input) ->
		console.log input
		'hello'
		)
	.filter('exceptFirst', (input) ->
		console.log input
		'hi'
		)
	.controller 'mainCtrl', ($scope, $timeout) ->
		$scope.toggleInfo = () ->
			$scope.infoOpen = !$scope.infoOpen
		$scope.toggleNav = () ->
			$scope.navOpen = !$scope.navOpen
		$scope.swipers = 
			vertical: null
			horz: new Array
		$scope.data = {};
		$scope.initPagers = () ->
			$timeout(() ->
				slideNames = new Array
				slideNames.push pager.attributes['data-name'].value for pager in $scope.swipers.vertical.slides
				pagination =  angular.element('.vert-pagination')
				pagers = pagination.find 'div.vert-pager'
					
				for item, i in pagers
					classes = angular.element(item).attr('class') + ' vert-pager'
					$(item).attr('data-title', slideNames[i]).append $('<div class="vert-pager-dot></div>')

			, 1000)
		window.onresize = ()->
			console.log $scope
			$scope.digest
	.controller('officeCtrl', ['$scope', 'officeService', ($scope, service) ->
		$scope.data = $scope.data || {}
		service.getBlaise().then (data) ->
			$scope.data.blaise = data.data
		service.getDidier().then (data) ->
			$scope.data.didier = data.data
	])
	.controller('projectCtrl', ['$scope', 'projectService', ($scope, service) ->
			$scope.data = $scope.data || {}
			service.getProjects().then (data) ->
				$scope.data.projects = data.data.nodes
			service.getMasai().then (data) ->
				$scope.data.masai = data.data.nodes[0].node
		])

	.controller('infoCtrl', ['$scope', 'nodeService', ($scope, service) ->
			$scope.data = $scope.data || {}
			service.getNode(5).then (data) ->
				$scope.data.info = data.data
		])
