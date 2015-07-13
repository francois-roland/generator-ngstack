'use strict';

(function(){

  /* @ngInject */

  var <%= cameledName %> = function () {
    // this will be called by angular using "new" on this function
    return {
      someProp: 'this is a property',
      someMethod: function() {
        return 'this is a method'
      }
    }
  };

  <%= cameledName %>
    .$inject = [];

  angular
    .module('<%= scriptAppName %>')
    .service('<%= cameledName %>',<%= cameledName %>);

})();
