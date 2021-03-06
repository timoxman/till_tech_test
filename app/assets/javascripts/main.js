// This line is related to our Angular app, not to our
// HomeCtrl specifically. This is basically how we tell
// Angular about the existence of our application.

//no var
var till = angular.module('tillapp', []);

// This routing directive tells Angular about the default
// route for our application. The term "otherwise" here
// might seem somewhat awkward, but it will make more
// sense as we add more routes to our application.
till.config([
  '$routeProvider', function($routeProvider) {
    return $routeProvider.otherwise({
      templateUrl: '../templates/home.html',
      controller: 'TillCtrl'
    });
  }
]);