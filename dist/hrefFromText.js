(function() {
  'use strict';
  angular.module('hrefFromText', []);

  angular.module('hrefFromText').directive('hrefFromText', function() {
    var patterns, urlPattern;
    urlPattern = /.?:\/\//;
    patterns = {
      'http://twitter.com/': /^@/,
      'mailto:': /.*@.*/,
      'http://': /\s*\.com/
    };
    return {
      scope: {
        hrefFromText: '@'
      },
      link: function(scope, element, attrs) {
        var href;
        href = function(value) {
          return element.attr('href', value);
        };
        return scope.$watch('hrefFromText', function(text) {
          var pattern, prefix;
          if (urlPattern.test(text)) {
            href(text);
            return;
          }
          for (prefix in patterns) {
            pattern = patterns[prefix];
            if (pattern.test(text)) {
              href(prefix + text);
              return;
            }
          }
        });
      }
    };
  });

}).call(this);
