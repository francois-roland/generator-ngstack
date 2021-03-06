'use strict';

(function(){

  /* ngInject */
  <% if(filters.ngroute) { %>
  var config = function($routeProvider) {
    $routeProvider
      .when('/login', {
        templateUrl: 'app/account/login/login.html',
        controller: 'LoginCtrl',
        controllerAs: 'login'
      })
      .when('/signup', {
        templateUrl: 'app/account/signup/signup.html',
        controller: 'SignupCtrl',
        controllerAs: 'signup'
      })
      .when('/settings', {
        templateUrl: 'app/account/settings/settings.html',
        controller: 'SettingsCtrl',
        controllerAs: 'settings',
        authenticate: true
      });
  };

  config
    .$inject = ['$routeProvider'];

  <% } %><% if(filters.uirouter) { %>
  var config = function($stateProvider) {
    $stateProvider
      .state('login', {
        url: '/login',
        templateUrl: 'app/account/login/login.html',
        controller: 'LoginCtrl',
        controllerAs: 'login',
      })
      .state('signup', {
        url: '/signup',
        templateUrl: 'app/account/signup/signup.html',
        controller: 'SignupCtrl',
        controllerAs: 'signup'
      })
      .state('settings', {
        url: '/settings',
        templateUrl: 'app/account/settings/settings.html',
        controller: 'SettingsCtrl',
        controllerAs: 'settings',
        authenticate: true
      });
  };

  config
    .$inject = ['$stateProvider'];

  <% } %>

  angular
    .module('<%= scriptAppName %>')
    .config(config);

})();
