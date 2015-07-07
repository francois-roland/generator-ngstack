'use strict';

  (function{
    /* @ngInject */
    var <%= cameledName %> = function($delegate) {
      // decorate the $delegate
      return $delegate;
    };

    <%= cameledName %>
      .$inject = ['$delegate'];

    var config = function($provide) {
      $provide.decorator('<%= cameledName %>', <%= cameledName %>);
    };

    config.$inject = ['$provide'];

    angular.module('<%= scriptAppName %>').config(config);

  })();
