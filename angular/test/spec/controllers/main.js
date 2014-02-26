'use strict';

describe('Controller: officeCtrl', function () {

  // load the controller's module
  beforeEach(module('myApp'));

  var officeCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    officeCtrl = $controller('testCtrl', {
      $scope: scope
    });
  }));

  it('should create a scope with test value of 3', function () {
    var ctrl = officeCtrl;
    expect(scope.test).toBe(3);
  });
});
