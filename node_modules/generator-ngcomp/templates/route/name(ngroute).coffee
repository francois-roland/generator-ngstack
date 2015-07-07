'use strict'

(->

  ### @ngInject ###

  config = ($routeProvider) ->
    $routeProvider.when '<%= route %>',
      templateUrl: '<%= htmlUrl %>'
      controller: '<%= classedName %>Ctrl'
      controllerAs: 'vm'

  config.$inject = ['$routeProvider']

  angular
    .module '<%= scriptAppName %>'
    .config config

)()
