'use strict'

(->
  ### @ngInject ###
  <% if(filters.ngroute) { %> config = ($routeProvider) ->
    $routeProvider
    .when '/admin',
      templateUrl: 'app/admin/admin.html'
      controller: 'AdminCtrl as admin'

  config
    .$inject = ['$routeProvider']

  <% } %><% if(filters.uirouter) { %>config = ($stateProvider) ->
    $stateProvider
    .state 'admin',
      url: '/admin'
      templateUrl: 'app/admin/admin.html'
      controller: 'AdminCtrl as admin'

  config
    .$inject = ['$stateProvider']

  <%} %>


  angular
    .module '<%= scriptAppName %>'
    .config config

)()
