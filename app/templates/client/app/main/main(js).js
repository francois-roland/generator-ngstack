'use strict';

(function(){

  /* ngInject */
  <% if(filters.ngroute) { %>
  var config = function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'app/main/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main'
      });
  };

  config
    .$inject = ['$routeProvider'];

  <% } %>
  <% if(filters.uirouter) { %>
  var config = function ($stateProvider) {
    $stateProvider
      .state('main', {
        url: '/',
        templateUrl: 'app/main/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main'
      });
  };

  config
    .$inject = ['$stateProvider'];
  <% } %>

  angular
    .module('<%= scriptAppName %>')
    .config(config);

})();
