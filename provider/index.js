'use strict';
var yeoman = require('yeoman-generator');

var Generator = yeoman.generators.Base.extend({
  compose: function() {
    this.composeWith('ngcomp:provider', {arguments: this.arguments}, { local: require.resolve('generator-ngcomp/provider') });
  }
});

module.exports = Generator;
