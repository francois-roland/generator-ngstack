'use strict';
var yeoman = require('yeoman-generator');

var Generator = yeoman.generators.Base.extend({
  compose: function() {
    this.composeWith('ngcomp:filter', {arguments: this.arguments}, { local: require.resolve('generator-ngcomp/filter') });
  }
});

module.exports = Generator;
