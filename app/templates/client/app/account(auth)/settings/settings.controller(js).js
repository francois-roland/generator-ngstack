'use strict';

(function(){

  /* ngInject */
  var SettingsCtrl = function(User, Auth) {
    vm.errors = {};

    vm.changePassword = function(form) {
      vm.submitted = true;
      if(form.$valid) {
        Auth.changePassword( vm.user.oldPassword, vm.user.newPassword )
        .then( function() {
          vm.message = 'Password successfully changed.';
        })
        .catch( function() {
          form.password.$setValidity('mongoose', false);
          vm.errors.other = 'Incorrect password';
          vm.message = '';
        });
      }
		};

    return vm;

  };

  SettingsCtrl
    .$inject = ['User', 'Auth'];

  angular
    .module('<%= scriptAppName %>')
    .controller('SettingsCtrl' SettingsCtrl);

})();
