'use strict'
angular.module('myApp')
	.controller('officeCtrl', ['$scope', 'officeService', ($scope, service) ->
		$scope.test = 3
		$scope.data = {}
		service.getBlaise().then (data) ->
			$scope.data.blaise = data.data
		service.getDidier().then (data) ->
			$scope.data.didier = data.data
	])
	.controller('projectCtrl', ['$scope', 'projectService', ($scope, service) ->
			$scope.data = {}
			service.getProjects().then (data) ->
				$scope.data.projects = data.data.nodes
			service.getMasai().then (data) ->
				$scope.data.masai = data.data.nodes[0].node
		])
	.controller 'testCtrl', ($scope) ->
		$scope.test = 3
