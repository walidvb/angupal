'use strict'
angular.module('myApp')
	.controller 'mainCtrl', ($scope, $timeout, nodeService) ->
		# All data is stored in the mainCtrl, very bad idea, but good enough for this
		$scope.data = $scope.data || {}
		nodeService.getProjects().then (data) ->
			$scope.data.projects = data.data.nodes
		nodeService.getNode(4).then (data) ->
			$scope.data.masai = data.data.nodes[0].node


		$scope.toggleInfo = (toOpen = null) ->
			console.log  ' requested ', toOpen
			$scope.infoOpen = toOpen || !$scope.infoOpen
			console.log 'togglingInfo to ', $scope.infoOpen
		$scope.toggleNav = (toOpen = null) ->
			$scope.navOpen = toOpen || !$scope.navOpen
			console.log '$scope', $scope
			$scope.infoOpen = false

		Mousetrap.bind('i', () ->
			do $scope.toggleInfo
			do $scope.digest
		)
		Mousetrap.bind('m', () ->
			do $scope.toggleNav
			do $scope.digest
		)
		Mousetrap.bind('esc', () ->
			$scope.infoOpen false
			do $scope.$digest
		)
		window.onresize = ()->
			$scope.digest
	.controller('officeCtrl', ['$scope', 'nodeService', ($scope, service) ->
		$scope.data.bios = new Array
		service.getBios().then (data) ->
			$scope.data.bios = data.data
	])
	.controller('infoCtrl', ['$scope', 'nodeService', ($scope, service) ->
			#$scope.data = $scope.data || {}
			service.getNode(5).then (data) ->
				$scope.data.info = data.data.nodes[0].node
		])
