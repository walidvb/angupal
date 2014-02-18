'use strict'


angular.module('myApp', ['ngResource'])
	.service('officeService', ['$http', ($http) ->
		@getBlaise = ->
			get 'node/1.json'

		@getDidier = ->
			get 'node/2.json'

		get = (url) ->
			data = $http(
				url : base_path + url
				method : 'GET'
				)
		@
	])
	.service('projectService', ['$http', ($http) ->
		@getMasai = ->
			get 'node/4/project.json'

		@getProjects = ->
			get 'projects.json'
		get = (url) ->
			data = $http(
				url : base_path + url
				method : 'GET'
				)
		@
	])
	