'use strict';
var yeoman = require('yeoman-generator');

var Generator = yeoman.generators.Base.extend({
  compose: function() {
    this.composeWith('ngcomp:route', {arguments: this.arguments}, { local: require.resolve('generator-ngcomp/route') });
  }
});

module.exports = Generator;
