'use strict'

(->

  ### @ngInject ###

  <%= cameledName %> = () ->
    templateUrl: '<%= htmlUrl %>'
    restrict: 'EA'
    link: (scope, element, attrs) ->
      console.log scope, element, attrs

  <%= cameledName %>
    .$inject = []

  angular
    .module '<%= scriptAppName %>'
    .directive '<%= cameledName %>',<%= cameledName %>

)()
