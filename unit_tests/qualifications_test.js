'use strict';

describe('myApp.qualifications module', function() {
  var $httpBackend, $rootScope;

  beforeEach(module('myApp.qualifications'));

  describe('qualifications controller', function(){

    beforeEach(inject(function($injector) {
     $httpBackend = $injector.get('$httpBackend');
     $rootScope = $injector.get('$rootScope');

    }));

    it('should make a call to the Gojimo API', inject(function($controller) {
      $httpBackend.expectGET('/qualifications').
          respond({name: "mocked response"});

      var scope = $rootScope.$new();
      var controller = $controller('QualificationsCtrl', {$scope: scope});

      $httpBackend.flush();

      expect(scope.qualifications).toEqual({name: "mocked response"});
    }));

    it('provides an error message if API fails', inject(function($controller) {
      $httpBackend.expectGET('/qualifications').
          respond(500, '');

      var scope = $rootScope.$new();
      var controller = $controller('QualificationsCtrl', {$scope: scope});

      $httpBackend.flush();

      expect(scope.warning).toEqual('Unfortunately we could not retrieve qualifications');
    }));

  });
});
