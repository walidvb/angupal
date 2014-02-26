'use strict'
angular.module('myApp')
	.controller 'mainCtrl', ($scope, $timeout, nodeService) ->
		$scope.data = $scope.data || {}
		nodeService.getProjects().then (data) ->
			$scope.data.projects = data.data.nodes
		nodeService.getNode(4).then (data) ->
			$scope.data.masai = data.data.nodes[0].node
		$scope.toggleInfo = (toOpen = null) ->
			$scope.infoOpen = toOpen || !$scope.infoOpen

		$scope.toggleNav = (toOpen = null) ->
			$scope.navOpen = toOpen || !$scope.navOpen
			#$scope.toggleInfo(false)
		$scope.swipers = 
			vertical: null
			horz: new Array
		$scope.data = {};
		$scope.initPagers = () ->
			$timeout(() ->
				slideNames = new Array
				slideNames.push pager.attributes['data-name'].value for pager in $scope.swipers.vertical.slides
				slideIcons = new Array
				slideIcons.push pager.attributes['data-icon'].value for pager in $scope.swipers.vertical.slides
				pagination =  angular.element('.vert-pagination')
				pagers = pagination.find 'div.vert-pager'
					
				for item, i in pagers
					title = #angular.element('<div class="title">'+slideNames[i]+'</div>')
					icon = angular.element('<img class="icon" src="'+slideIcons[i]+'"/>')
					console.log icon
					angular.element(item)
						.attr('data-title', slideNames[i])
						.append  icon
			, 0)
		Mousetrap.bind('i', () ->
			$scope.toggleInfo();
			$scope.$digest();
		)
		Mousetrap.bind('m', () ->
			$scope.toggleNav();
			$scope.$digest();
		)
		window.onresize = ()->
			$scope.digest
	.controller('officeCtrl', ['$scope', 'nodeService', ($scope, service) ->
		$scope.data = $scope.data || {}
		service.getNode(1).then (data) ->
			$scope.data.blaise = data.data.nodes[0].node
		service.getNode(2).then (data) ->
			$scope.data.didier = data.data.nodes[0].node
	])
	.controller('infoCtrl', ['$scope', 'nodeService', ($scope, service) ->
			$scope.data = $scope.data || {}
			service.getNode(5).then (data) ->
				$scope.data.info = data.data.nodes[0].node
		])
