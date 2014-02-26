// Generated by CoffeeScript 1.6.2
(function() {
  'use strict';  angular.module('myApp', ['ngResource']).service('projectService', [
    '$http', function($http) {
      var get;

      this.getMasai = function() {
        return get('node/4.json');
      };
      this.getProjects = function() {
        return get('projects.json');
      };
      get = function(url) {
        var data;

        return data = $http({
          url: base_path + url,
          method: 'GET'
        });
      };
      return this;
    }
  ]).controller('projectCtrl', [
    '$scope', 'officeService', function($scope, service) {
      $scope.bio = {};
      service.getProjects().then(function(data) {
        console.log(data);
        return $scope.projects = data.data;
      });
      return service.getMasai().then(function(data) {
        console.log(data);
        return $scope.masai = data.data;
      });
    }
  ]);

}).call(this);