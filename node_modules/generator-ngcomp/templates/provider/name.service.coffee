'use strict'

(->

  ### @ngInject ###

  <%= cameledName %>Provider = ($injector) ->

    #private variables
    salutation = 'hello'

    #private method
    class Greeter
      @greet = ->
        console.log salutation

    #public config api
    @setSalutation = (s) ->
      salutation = s

    #instantiating method
    @$get = ($injector) ->
      #in a provider, you can't call other dependencies, except in the $get method, using the $injector service
      $q = injector.get '$q'
      defered = $q.defer()

      defered.promise.then (response) ->
        @setSalutation(response)
        new Greeter()

      defered.resolve 'Hello There !'

    return

  <%= cameledName %>
    .$inject = ['$injector']

  angular
    .module '<%= scriptAppName %>'
    .provider '<%= cameledName %>',<%= cameledName %>Provider

)()
