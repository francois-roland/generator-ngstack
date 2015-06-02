'use strict'

(->
  ### @ngInject ###

  SettingsCtrl = (User, Auth) ->
    vm = @
    vm.errors = {}
    vm.changePassword = (form) ->
      vm.submitted = true

      if form.$valid
        Auth.changePassword vm.user.oldPassword, vm.user.newPassword
        .then ->
          vm.message = 'Password successfully changed.'

        .catch ->
          form.password.$setValidity 'mongoose', false
          vm.errors.other = 'Incorrect password'
          vm.message = ''

  SettingsCtrl
    .$inject = ['User', 'Auth']

  angular
    .module '<%= scriptAppName %>'
    .controller 'SettingsCtrl', SettingsCtrl

)()
