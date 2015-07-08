'use strict';

/**
 * Removes server error when user updates input
 */

(function(){

  /* ngInject */

  var mongooseError = function() {
    return {
      restrict: 'A',
      require: 'ngModel',
      link:function(scope, element, attrs, ngModel) {
        element.on('keydown', function(){
          return ngModel.$setValidity('mongoose',true);
        });
      };
    };
  };

  angular
    .module('<%= scriptAppName %>')
    .directive('mongooseError', mongooseError);

})();
