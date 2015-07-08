'use strict';

(function(){

  /* ngInject */
  var NavbarCtrl = function($location <% if(filters.auth) { %>, Auth <% } %>){

    var vm = this;

    vm.menu = [{
      'title': 'Home',
      'link': '/'
    }];

    vm.isCollapsed = true;<% if (filters.auth) { %>
    vm.isLoggedIn =Auth.isLoggedIn;
    vm.isAdmin = Auth.isAdmin;
    vm.getCurrentUser = Auth.getCurrentUser;

    vm.logout = function(){
      Auth.logout();
      $location.path('/login');
    }; <% } %>

    vm.isActive = function (route) {
      return route === $location.path();
    };

    return vm;

  };

  NavbarCtrl
    .$inject = ['$location'<% if(filters.auth) { %>, 'Auth' <% } %>];

  angular
    .module('<%= scriptAppName %>')
    .controller('NavbarCtrl',NavbarCtrl);


})();
