'use strict'

(->

  ### @ngInject ###

  <% if(filters.ngroute) { %>
  conf = ($routeProvider, $locationProvider<% if (filters.auth) { %>, $httpProvider<% } %>) ->
    $routeProvider
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode true <% if (filters.auth) { %>
    $httpProvider.interceptors.push 'authInterceptor'<% } %>

  conf
    .$inject = ['$routeProvider', '$locationProvider'<% if(filters.auth) {%>,'$httpProvider' <% } %>]

  <% } %><% if (filters.uirouter) { %>
  conf = ($stateProvider, $urlRouterProvider, $locationProvider<% if (filters.auth) { %>, $httpProvider<% } %>) ->
    $urlRouterProvider
      .otherwise '/'

    $locationProvider.html5Mode true <% if (filters.auth) { %>
    $httpProvider.interceptors.push 'authInterceptor' <% } %>

  conf
    .$inject = ['$stateProvider','$urlRouterProvider','$locationProvider'<% if(filters.auth) {%>,'$httpProvider' <% } %>]

  <% } %>

  <% if(filters.auth) { %>
  authInterceptor = ($rootScope, $q, $cookieStore, $location) ->
    # Add authorisation token to headers
    request: (config) ->
      config.headers = config.headers or {}
      config.headers.Authorization = 'Bearer ' + $cookieStore.get 'token' if $cookieStore.get 'token'
      config

    # Intercept 401s and redirect to login route
    responseError: (response) ->
      if response.status is 401
        $location.path '/login'
        #remove stale tokens
        $cookieStore.remove 'token'

      $q.reject response

  authInterceptor
    .$inject = ['$rootScope', '$q', '$cookieStore', '$location']

  bootstrap = ($rootScope, $location, Auth) ->
    # redirect to login if route requires auth and user is not logged in
    $rootScope.$on <% if (filters.ngroute) {%> '$routeChangeStart'<% } %><% if (filters.uirouter) { %> '$stateChangeStart'<% } %>, (event, next) ->
      Auth.isLoggedInAsync (loggedIn) ->
        $location.path "/login" if next.authenticate and not loggedIn

  bootstrap
    .$inject = ['$rootScope', '$location', 'Auth']

  <% } %>

  dependencies = [<%= angularModules%>]

  angular
    .module '<%= scriptAppName %>', dependencies
    .config conf
    <% if (filters.auth) { %>.factory 'authInterceptor', authInterceptor
    .run bootstrap <% } %>

)()
