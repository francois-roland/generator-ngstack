'use strict'

(->
  ### @ngInject ###
  MainCtrl = ($http<% if(filters.socketio) { %>, socket<% } %>) ->

    vm = @

    vm.awesomeThings = []

    $http.get('/api/things').success (awesomeThings) ->
      vm.awesomeThings = awesomeThings
      <% if(filters.socketio) { %>socket.syncUpdates 'thing', vm.awesomeThings<% } %>

    <% if(filters.mongoose) { %>

    vm.addThing = () ->
      return if vm.newThing is ''
      $http.post '/api/things',
        name: vm.newThing

      vm.newThing = ''

    vm.deleteThing = (thing) ->
      $http.delete '/api/things' + thing._id<% } %><% if(filters.socketio) { %>

    vm.$on '$destroy', () ->
      socket.unsyncUpdates 'thing' <% } %>

  MainCtrl
    .$inject = ['$http'<% if(filters.socketio) { %>, 'socket' <% } %>]

  angular
    .module '<%= scriptAppName %>'
    .controller 'MainCtrl', MainCtrl

)()
