'use strict';

(function(){

  /* @ngInject */

  var <%= cameledName %>Provider = function($injector) {

    // private var
    var salutation = 'hello';

    // private method
    function Greeter() {
      this.greet = function() {
        console.log salutation;
      }
    };

    //public config api
    this.setSalutation = function(s) {
      salutation = s;
    };

    // Instantiation method
    this.$get = function ($injector) {
      // in a provider, you can't call other dependencies, except in the $get method, using the $injector service

      var $q = $injector.get('$q');
      var defered = $q.defer();
      defered.promise.then(function(response){
        this.setSalutation(response);
        return new Greeter();
      });

      defered.resolve('Hello there !');

    };
  };

  <%= cameledName %>Provider
    .$inject = ['$injector'];

  angular
    .module('<%= scriptAppName %>')
    .provider('<%= cameledName %>', <%= cameledName %>Provider);

})();
