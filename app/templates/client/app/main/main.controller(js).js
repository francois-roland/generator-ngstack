'use strict';

(function(){

  /* ngInject */

  var MainCtrl = function($http<% if(filters.socketio) { %>, socket<% } %>){
    var vm = this;
    vm.title = 'Allo, Allo !';
    vm.awesomeThings = [];

    $http.get('api/things').success(function(awesomeThings) {
      vm.awesomeThings = awesomeThings;<% if(filters.socketio) { %>
      socket.syncUpdates('thing', $scope.awesomeThings);<% } %>
    });

    <% if(filters.mongoose) { %>
    vm.addThing = function() {
      if(vm.newThing === '') {
        return;
      }
      $http.post('/api/things', { name: vm.newThing });
      vm.newThing = '';
    };

    vm.deleteThing = function(thing) {
      $http.delete('/api/things/' + thing._id);
    };<% } %><% if(filters.socketio) { %>

    vm.$on('$destroy', function () {
      socket.unsyncUpdates('thing');
    });<% } %>

    return vm

  };

  MainCtrl
    .$inject = ['$http'<% if(filters.socketio) { %>, 'socket'<% } %>];

  angular
    .module('<%= scriptAppName %>')
    .controller('MainCtrl',MainCtrl);

})();
