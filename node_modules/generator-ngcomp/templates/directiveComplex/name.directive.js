'use strict';

(function(){

  /* @ngInject */

  var <%= cameledName %> = function() {
    return {
      templateUrl: '<%= htmlUrl %>',
      restrict: 'EA',
      link: function (scope, element, attrs) {
        console.log(scope, element, attrs);
      }
    }
  };

  <%= cameledName %>
    .$inject = [''];

  angular
    .module('<%= scriptAppName %>')
    .directive('<%= cameledName %>',<%= cameledName %>);

})();
