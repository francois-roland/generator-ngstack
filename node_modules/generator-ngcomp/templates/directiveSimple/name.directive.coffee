'use strict'

(->

  ### @ngInject ###

  <%= cameledName %> = () ->
    template: '<div></div>'
    restrict: 'EA'
    link: (scope, element, attrs) ->
      console.log scope, element, attrs

  <%= cameledName %>
    .$inject = ['']

  angular
    .module '<%= scriptAppName %>'
    .directive '<%= cameledName %>',<%= cameledName %>

)()
