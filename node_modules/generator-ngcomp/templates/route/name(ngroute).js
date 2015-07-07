'use strict';

(function(){

  /* ngInject */
  var config = function ($routeProvider) {
    $routeProvider
      .when('<%= route %>', {
        templateUrl: '<%= htmlUrl %>',
        controller: '<%= classedName %>Ctrl as <%= classedName %>'
      });
  };

  config.$inject = ['$routeProvider'];

  angular
    .module('<%= scriptAppName %>')
    .config(config);

})();
