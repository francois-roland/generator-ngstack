'use strict';

(function(){

  /* ngInject */
  var <%= classedName%>Ctrl = function () {
    vm = this;
    vm.message = 'Hello there';
  };

  <%= classedName %>Ctrl
    .$inject = [''];

  angular
    .module('<%= scriptAppName %>')
    .controller('<%= classedName %>Ctrl',<%= classedName %>Ctrl);

})();
