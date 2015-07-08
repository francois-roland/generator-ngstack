'use strict'

(->
  ### @ngInject ###
  <% if(filters.ngroute) { %>
  config = ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'app/main/main.html'
        controller: 'MainCtrl'
        controllerAs:'main'

  config
    .$inject = ['$routeProvider']
  <% } %><% if(filters.uirouter) {%>
  config = ($stateProvider) ->
    $stateProvider
      .state 'main',
        url:'/'
        templateUrl: 'app/main/main.html'
        controller: 'MainCtrl'
        controllerAs:'main'

  config
    .$inject = ['$stateProvider']
  <% } %>

  angular
    .module '<%= scriptAppName %>'
    .config config

)()
