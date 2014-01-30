'use strict'

angular.module 'hrefFromText', []

angular.module('hrefFromText')
  .directive 'hrefFromText', ->
    template: '<div></div>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the hrefFromText directive'