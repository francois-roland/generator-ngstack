'use strict'

(->

  ### @ngInject ###

  NavbarCtrl = ($location <% if(filters.auth) { %>, Auth <% } %>) ->
    vm = @

    vm.menu = [
      title: 'Home'
      link: '/'
    ]

    vm.isCollapsed = true<% if(filters.auth) { %>
    vm.isLoggedIn = Auth.isLoggedIn
    vm.isAdmin = Auth.isAdmin
    vm.getCurrentUser = Auth.getCurrentUser

    vm.logout = ->
      Auth.logout()
      $location.path '/login'<% } %>

    vm.isActive = (route) ->
      route is $location.path()

    return vm

  NavbarCtrl
    .$inject = ['$location'<% if (filters.auth) { %>,'Auth' <% } %>]

  angular
    .module '<%= scriptAppName %>'
    .controller 'NavbarCtrl', NavbarCtrl

)()
