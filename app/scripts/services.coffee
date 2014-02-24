'use strict'


angular.module('myApp', ['ngResource'])
	.service('drupal', ['$http', ($http) ->
		auth = null
		getAuth = -> 
			if auth
				return auth
			else
				$http
					url: base_path + 'user'
					method: 'GET'

		@auth = ->
			getAuth()
	])
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
	.service('nodeService', ['$http', ($http) ->
		@getNode = (nid)->
			get 'node/'+nid+'.json'
			
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
	