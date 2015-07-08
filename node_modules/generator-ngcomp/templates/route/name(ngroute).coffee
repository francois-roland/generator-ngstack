'use strict'

(->

  ### @ngInject ###

  config = ($routeProvider) ->
    $routeProvider.when '<%= route %>',
      templateUrl: '<%= htmlUrl %>'
      controller: '<%= classedName %>Ctrl'
      controllerAs: '<%= classedNames %>'

  config.$inject = ['$routeProvider']

  angular
    .module '<%= scriptAppName %>'
    .config config

)()
