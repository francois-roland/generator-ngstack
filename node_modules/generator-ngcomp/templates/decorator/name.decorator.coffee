'use strict'

(->

  ### @ngInject ###

  <%= cameledName %> = ($delegate) ->
    $delegate

  <%= cameledName %>.$inject = ['$delegate']

  config = ($provide) ->
    $provide.decorator <%= cameledName %>

  config.$inject = ['$provide'];

  angular
    .module '<%= scriptAppName %>'
    .config config


)()
