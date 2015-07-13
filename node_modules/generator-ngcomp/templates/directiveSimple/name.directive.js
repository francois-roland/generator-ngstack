'use strict';

(function(){

  /* @ngInject */

  var <%= cameledName %> = function() {
    return {
      template: '<div></div>',
      restrict: 'EA',
      link: function (scope, element, attrs) {
        console.log(scope, element, attrs);
      }
    }
  };

  <%= cameledName %>
    .$inject = [];

  angular
    .module('<%= scriptAppName %>')
    .directive('<%= cameledName %>',<%= cameledName %>);

})();
