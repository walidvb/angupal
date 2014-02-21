'use strict';

var myApp = angular.module('myApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
])
  .config(function () {
	

  });
Mousetrap.bind('a d m i n', function(){
			window.location = base_path + 'admin/content';
	});