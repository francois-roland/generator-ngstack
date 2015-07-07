'use strict';
var yeoman = require('yeoman-generator');

var Generator = yeoman.generators.Base.extend({
  compose: function() {
    this.composeWith('ngcomp:decorator', {arguments: this.arguments}, { local: require.resolve('generator-ngcomp/decorator') });
  }
});

module.exports = Generator;
