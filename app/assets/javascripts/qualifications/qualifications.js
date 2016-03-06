'use strict';

angular.module('myApp.qualifications', ['ngRoute', 'http-etag'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/qualifications', {
    templateUrl: 'qualifications/_qualifications.html',
    controller: 'QualificationsCtrl'
  });
}])

.controller('QualificationsCtrl', ['$scope', '$http', function($scope, $http) {
  $http.get('/qualifications', {
    etag: true
  })
  .cache(function (cachedData) {
    if (!$scope.qualifications) $scope.qualifications = cachedData
  })
  .success(function (data) {
    $scope.qualifications = data
  })
  .error(function (data, status) {
    // 304: 'Not Modified', etags matched
    if (status != 304) $scope.warning = 'Unfortunately we could not retrieve qualifications';
  });

}]);
