'use strict'

(->

  ### @ngInject ###

  socket = () ->
    socket:
      connect: ->

      on: ->

      emit: ->

      receive: ->

    syncUpdates: ->

    unsyncUpdates: ->

  socket
    .$inject = ['']

  angular
    .module 'socketMock', []
    .factory 'socket', socket

)()
