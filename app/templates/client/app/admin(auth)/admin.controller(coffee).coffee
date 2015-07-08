'use strict'

(->
  ### @ngInject ###

  AdminCtrl = ($http, Auth, User) ->

    vm = @

    vm.users = User.query();

    vm.delete = (user) ->
      User.remove id: user._id
      _.remove vm.users, user

    return vm

  AdminCtrl
    .$inject = ['$http','Auth', 'User']

  angular
    .module '<%= scriptAppName %>'
    .controller 'AdminCtrl', AdminCtrl

)()
