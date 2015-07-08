'use strict';

(function(){

  /* ngInject */

  var socket = function() {
    return {
      socket: {
        connect: function(){},
        on: function(){},
        emit: function(){},
        receive: function(){},
      },
      syncUpdates: function(){},
      unsyncUpdates: function(){},
    };
  };

  socket
    .$inject = [''];

  angular
    .module('socketMock',[])
    .factory('socket',socket);

})();
