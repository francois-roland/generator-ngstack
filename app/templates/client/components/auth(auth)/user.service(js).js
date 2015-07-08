'use strict';

(function(){

  /* ngInject */
  var User = function ($resource) {
    return $resource('/api/users/:id/:controller', {
      id: '@_id'
    },
    {
      changePassword: {
        method: 'PUT',
        params: {
          controller:'password'
        }
      },
      get: {
        method: 'GET',
        params: {
          id:'me'
        }
      }
	  });
  };

  User
    .$inject = ['$resource'];

  angular
    .module('<%= scriptAppName %>')
    .factory('User', User);

})();
