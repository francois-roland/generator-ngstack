'use strict';
var yeoman = require('yeoman-generator');

var Generator = yeoman.generators.Base.extend({
  compose: function() {
    this.composeWith('ngcomp:controller', {arguments: this.arguments}, { local: require.resolve('generator-ngcomp/controller') });
  }
});

module.exports = Generator;
