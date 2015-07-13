'use strict'

(->

  ### @ngInject ###

  <%= cameledName %> = () ->
    (input) ->
      '<%= cameledName %> filter: ' + input

  <%= cameledName %>
    .$inject = []

  angular
    .module '<%= scriptAppName %>'
    .filter '<%= cameledName %>', <%= cameledName %>

)()
