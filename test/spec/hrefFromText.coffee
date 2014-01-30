'use strict'

describe 'Directive: hrefFromText', ->

  beforeEach module 'hrefFromText'

  scope = {}

  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<href-from-text></href-from-text>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the hrefFromText directive'
