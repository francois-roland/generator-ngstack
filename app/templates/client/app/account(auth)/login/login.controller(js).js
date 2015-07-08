'use strict';

(function(){

  /* ngInject */
  var LoginCtrl = function(Auth, $location<% if (filters.oauth) { %>, $window<% } %>){
    vm.user = {};
    vm.errors = {};

    vm.login = function(form) {
      vm.submitted = true;

      if(form.$valid) {
        Auth.login({
          email: vm.user.email,
          password: vm.user.password
        })
        .then( function() {
          // Logged in, redirect to home
          $location.path('/');
        })
        .catch( function(err) {
          vm.errors.other = err.message;
        });
      }
    };
<% if(filters.oauth) {%>
    vm.loginOauth = function(provider) {
      $window.location.href = '/auth/' + provider;
    };<% } %>

    return vm;
    
  };

  LoginCtrl
    .$inject = ['Auth', '$location'<% if (filters.oauth) { %>, '$window'<% } %>];

  angular
    .module('<%= scriptAppName %>')
    .controller('LoginCtrl',LoginCtrl);

})();
