'use strict'

(->

  ### @ngInject ###

  <%= cameledName %> = () ->

    #inside logic
    meaningOfLife = 42

    #public API

    someMethod: ->
      meaningOfLife

  <%= cameledName %>
    .$inject = []

  angular
    .module '<%= scriptAppName %>'
    .factory '<%= cameledName %>', <%= cameledName %>

)()
