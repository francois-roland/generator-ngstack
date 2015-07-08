'use strict'

(->
  ### @ngInject ###

  loginCtrl = (Auth, $location<% if(filters.oauth) {%>, $window<% } %>) ->
    vm = @
    vm.user = {}
    vm.errors = {}
    vm.login = (form) ->
      vm.submitted = true

      if form.$valid
        # Logged in, redirect to home
        Auth.login
          email: vm.user.email
          password: vm.user.password

        .then ->
          $location.path '/'

        .catch (err) ->
          vm.errors.other = err.message
  <% if(filters.oauth) {%>

    vm.loginOauth = (provider) ->
      $window.location.href = '/auth/' + provider<% } %>

    return vm

  loginCtrl
    .$inject = ['Auth','$location'<% if(filters.oauth) {%>,'$window'<% } %>]

  angular
    .module '<%= scriptAppName %>'
    .controller 'LoginCtrl', loginCtrl

)()
