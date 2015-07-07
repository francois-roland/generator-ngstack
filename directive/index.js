'use strict';
var yeoman = require('yeoman-generator');

var Generator = yeoman.generators.Base.extend({
  compose: function() {
    this.composeWith('ngcomp:directive', {arguments: this.arguments}, { local: require.resolve('generator-ngcomp/directive') });
  }
});

module.exports = Generator;
