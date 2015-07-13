'use strict'

(->

  ### @ngInject ###

  <%= cameledName %> = () ->
    # Angular will call this using "new" on this function
    {
      someProp: 'this is a property'
      someMethod: ()->
        return 'this is a method'
    }

  <%= cameledName %>
    .$inject = []

  angular
    .module '<%= scriptAppName %>'
    .service '<%= cameledName %>',<%= cameledName %>

)()
