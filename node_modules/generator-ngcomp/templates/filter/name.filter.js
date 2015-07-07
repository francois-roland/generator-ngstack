'use strict';

(function(){

  /* @ngInject */

  var <%= cameledName %> = function() {
    return function(input) {
      return '<%= cameledName %> filter: ' + input;
    }
  };

  <%= cameledName %>
    .$inject = [''];

  angular
    .module('<%= scriptAppName %>')
    .filter('<%= cameledName %>',<%= cameledName %>);

})();
