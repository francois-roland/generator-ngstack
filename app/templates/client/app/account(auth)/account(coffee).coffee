'use strict'

(->
  ### @ngInject ###

  <% if(filters.ngroute) {%>
  config = ($routeProvider) ->
    $routeProvider
    .when '/login',
      templateUrl: 'app/account/login/login.html'
      controller: 'LoginCtrl as login'

    .when '/signup',
      templateUrl: 'app/account/signup/signup.html'
      controller: 'SignupCtrl as signup'

    .when '/settings',
      templateUrl: 'app/account/settings/settings.html'
      controller: 'SettingsCtrl as settings'
      authenticate: true

  config
    .$inject = ['$routeProvider']

  <% } %><% if(filters.uirouter) { %>
  config = ($stateProvider) ->
    $stateProvider
    .state 'login',
      url: '/login'
      templateUrl: 'app/account/login/login.html'
      controller: 'LoginCtrl as login'

    .state 'signup',
      url: '/signup'
      templateUrl: 'app/account/signup/signup.html'
      controller: 'SignupCtrl as signup'

    .state 'settings',
      url: '/settings'
      templateUrl: 'app/account/settings/settings.html'
      controller: 'SettingsCtrl as settings'
      authenticate: true

  config
    .$inject = ['$stateProvider']

  <% } %>

  angular
    .module '<%= scriptAppName %>'
    .config config

)()
