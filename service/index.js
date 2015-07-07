'use strict';
var yeoman = require('yeoman-generator');

var Generator = yeoman.generators.Base.extend({
  compose: function() {
    this.composeWith('ngcomp:service', {arguments: this.arguments}, { local: require.resolve('generator-ngcomp/service') });
  }
});

module.exports = Generator;
