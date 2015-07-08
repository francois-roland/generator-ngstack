'use strict';

(function(){

  /* ngInject */
  <% if (filters.ngroute) { %>
  var config = function($routeProvider) {
    $routeProvider
      .when('/admin',{
        templateUrl: 'app/admin/admin.html',
        controller: 'AdminCtrl',
        controllerAs: 'admin'
      });
  };

  config
    .$inject = ['$routeProvider'];
  <% } %>

  <% if (filters.uirouter) { %>
  var config = function($stateProvider) {
    $stateProvider
      .state('admin', {
        url: '/admin',
        templateUrl: 'app/admin/admin.html',
        controller: 'AdminCtrl',
        controllerAs: 'admin'
      });
  };

  config
    .$inject = ['$stateProvider'];

  <% } %>

  angular
    .module('<%= scriptAppName %>')
    .config(config);

})();
