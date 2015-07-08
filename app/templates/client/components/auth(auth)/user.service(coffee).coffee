'use strict'

(->

  ### @ngInject ###
  User = ($resource) ->
    $resource '/api/users/:id/:controller',
      id: '@_id'
    ,
      changePassword:
        method: 'PUT'
        params:
          controller: 'password'

      get:
        method: 'GET'
        params:
          id: 'me'

  User
    .$inject = ['$resource']

  angular
    .module '<%= scriptAppName %>'
    .factory 'User', User

)()
