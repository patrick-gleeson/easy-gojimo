'use strict';

angular.module('myApp', [
  'templates',
  'ngRoute',
  'http-etag',
  'myApp.qualifications'
]).
config(['$routeProvider', function($routeProvider) {
  $routeProvider.otherwise({redirectTo: '/qualifications'});
}]);
