'use strict';

(function(){

  /* ngInject */

  var AdminCtrl = function($http,Auth,User) {
    var vm = this;

    vm.users = User.query();

    vm.delete = function(user) {
      User.remove({id: user._id});
      angular.forEach(vm.users, function (u,i){
        if (u === user) {
          vm.users.splice(i,1);
        }
      });
    };

    return vm
  };

  AdminCtrl
    .$inject = ['$http','Auth', 'User'];

  angular
    .module('<%= scriptAppName %>')
    .controller('AdminCtrl',AdminCtrl);

})();
