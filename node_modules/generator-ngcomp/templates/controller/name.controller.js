'use strict';

(function () {
  /* @ngInject */
  var <%= classedName %>Ctrl = function(){
    var vm = this;
    vm.message = 'Hello there !';

    return vm
  };

  <%= classedName %>Ctrl
    .$inject = [''];

  angular.module('<%= scriptAppName %>')
    .controller('<%= classedName %>Ctrl', <%= classedName %>Ctrl);

})();
