// Generated by CoffeeScript 1.6.2
(function() {
  'use strict';  angular.module('myApp').filter('first', function(input) {
    console.log(input);
    return 'hello';
  }).filter('exceptFirst', function(input) {
    console.log(input);
    return 'hi';
  }).controller('mainCtrl', function($scope, $timeout) {
    $scope.toggleInfo = function() {
      return $scope.infoOpen = !$scope.infoOpen;
    };
    $scope.swipers = {
      vertical: null,
      horz: new Array
    };
    $scope.data = {};
    $scope.initPagers = function() {
      return $timeout(function() {
        var classes, i, item, pager, pagers, pagination, slideNames, _i, _j, _len, _len1, _ref, _results;

        slideNames = new Array;
        _ref = $scope.swipers.vertical.slides;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          pager = _ref[_i];
          slideNames.push(pager.attributes['data-name'].value);
        }
        pagination = angular.element('.vert-pagination');
        pagers = pagination.find('div.vert-pager');
        _results = [];
        for (i = _j = 0, _len1 = pagers.length; _j < _len1; i = ++_j) {
          item = pagers[i];
          classes = angular.element(item).attr('class') + ' vert-pager';
          _results.push($(item).attr('data-title', slideNames[i]).append($('<div class="vert-pager-dot></div>')));
        }
        return _results;
      }, 1000);
    };
    return window.onresize = function() {
      console.log($scope);
      return $scope.digest;
    };
  }).controller('officeCtrl', [
    '$scope', 'officeService', function($scope, service) {
      $scope.data = $scope.data || {};
      service.getBlaise().then(function(data) {
        return $scope.data.blaise = data.data;
      });
      return service.getDidier().then(function(data) {
        return $scope.data.didier = data.data;
      });
    }
  ]).controller('projectCtrl', [
    '$scope', 'projectService', function($scope, service) {
      $scope.data = $scope.data || {};
      service.getProjects().then(function(data) {
        return $scope.data.projects = data.data.nodes;
      });
      return service.getMasai().then(function(data) {
        return $scope.data.masai = data.data.nodes[0].node;
      });
    }
  ]).controller('infoCtrl', [
    '$scope', 'nodeService', function($scope, service) {
      $scope.data = $scope.data || {};
      return service.getNode(5).then(function(data) {
        return $scope.data.info = data.data;
      });
    }
  ]);

}).call(this);
