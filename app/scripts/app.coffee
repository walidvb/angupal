'use strict';

myApp = angular.module('myApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
])

Mousetrap.bind 'a d m i n', () ->
			window.location = base_path + 'admin/content';