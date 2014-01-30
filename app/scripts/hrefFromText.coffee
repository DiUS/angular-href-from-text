'use strict'

angular.module 'hrefFromText', []

angular.module('hrefFromText')
  .directive 'hrefFromText', ->
    
    # pattern for a url
    urlPattern = /.?:\/\//

    # patterns (order matters)
    patterns   = 
      'http://twitter.com/': /^@/
      'mailto:':             /.*@.*/
      'http://':             /\s*\.com/

    # directive
    scope:
      hrefFromText: '@'
    link: (scope, element, attrs) ->
      # set the href on the attribute
      href = (value) ->
        element.attr 'href', value

      # listen for changes
      scope.$watch 'hrefFromText', (text) ->

        # already a url
        if urlPattern.test text
          href text 
          return

        # find a matching pattern
        for prefix, pattern of patterns
          if pattern.test text
            href prefix + text 
            return