'use strict';

(function(){

  /* @ngInject */

  var <%= cameledName %> = function() {

    // inside logic
    var meaningOfLife = 42;

    // public API
    return {
      someMethod: function() {
        return meaningOfLife;
      }
    };

  };

  <%= cameledName %>
    .$inject = [];

  angular
    .module('<%= scriptAppName %>')
    .factory('<%= cameledName %>',<%= cameledName %>);

})();
