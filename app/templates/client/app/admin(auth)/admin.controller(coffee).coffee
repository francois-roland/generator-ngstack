'use strict'

(->
  ### @ngInject ###

  AdminCtrl = ($http, Auth, User) ->

    vm = @

    $http.get 'api/users'
    .success(users) ->
      vm.users = users

    $scope.delete = (user) ->
      User.remove id: user._id
      _.remove vm.users, user

  AdminCtrl
    .$inject = ['$http','Auth', 'User']

  angular
    .module '<%= scriptAppName %>'
    .controller 'AdminCtrl', AdminCtrl

)()
