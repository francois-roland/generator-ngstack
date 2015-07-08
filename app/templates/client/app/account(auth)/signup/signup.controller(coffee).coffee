'use strict'

(->

  ### @ngInject ###
  SignupCtrl = (Auth, $location<% if (filters.oauth) {%>, $window <% } %>) ->
    vm = @
    vm.user = {}
    vm.errors = {}
    vm.register = (form) ->
      vm.submitted = true

      if form.$valid
        # Account created, redirect to home
        Auth.createUser
          name: vm.user.name
          email: vm.user.email
          password: vm.user.password

        .then ->
          $location.path '/'

        .catch (err) ->
          err = err.data
          vm.errors = {}

          # Update validity of form fields that match the mongoose errors
          angular.forEach err.errors, (error, field) ->
            form[field].$setValidity 'mongoose', false
            vm.errors[field] = error.message
  <% if(filters.oauth) {%>
    vm.loginOauth = (provider) ->
      $window.location.href = '/auth/' + provider<% } %>

    return vm

  SignupCtrl
    .$inject = ['Auth', '$location'<% if (filters.oauth) {%>, '$window' <% } %>]

  angular
    .module '<%= scriptAppName %>'
    .controller 'SignupCtrl', SignupCtrl

)();
