'use strict'

describe 'Directive: hrefFromText', ->

  beforeEach module 'hrefFromText'

  scope   = {}
  element = null

  beforeEach inject ($rootScope, $compile) ->
    scope = $rootScope.$new()
    scope.text = null

    element = angular.element '<a href-from-text="{{text}}">link</a>'
    element = $compile(element) scope

  it 'should identify a twitter handler', ->
    scope.text = '@azzamallow'
    scope.$digest()
    expect(element.attr('href')).toBe 'http://twitter.com/@azzamallow'

  it 'should identify an email address', ->
    scope.text = 'azzamallow@github.com'
    scope.$digest()
    expect(element.attr('href')).toBe 'mailto:azzamallow@github.com'

  it 'should identify any www url', ->
    scope.text = 'www.nba.com'
    scope.$digest()
    expect(element.attr('href')).toBe 'http://www.nba.com'

  it 'should identify a http url and return itself', ->
    scope.text = 'http://www.google.com'
    scope.$digest()
    expect(element.attr('href')).toBe 'http://www.google.com'

  it 'should identify a https url and return itself', ->
    scope.text = 'https://www.google.com'
    scope.$digest()
    expect(element.attr('href')).toBe 'https://www.google.com'

  it 'should return null if the url could not be identified', ->
    scope.text = '+1 (111) 111-1111'
    scope.$digest()
    expect(element.attr('href')).toBeUndefined()
