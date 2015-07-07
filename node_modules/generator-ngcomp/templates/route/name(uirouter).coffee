'use strict'

(->

  ### @ngInject ###

  config = ($stateProvider) ->
    $stateProvider
      .state '<%= name %>',
        url: '<%= route %>'
        templateUrl: '<%= htmlUrl %>'
        controller: '<%= classedName %>Ctrl'
        controllerAs: 'vm'

  config
    .$inject = ['$stateProvider']

  angular
    .module '<%= scriptAppName %>'
    .config config

)()
