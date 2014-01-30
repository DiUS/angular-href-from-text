angular-href-from-text
======================

A simple directive that will take text and determine a href for it


install
-------

```
bower install angular-href-from-text
```

usage
-----

Make sure you include the module in your application config

```
angular.module('myApp', [
  'hrefFromText',
  ...
]);
```

Example

In a controller, set some text to the scope
```
$scope.text = 'azzamallow@github.com';
```

Reference that text in the directive to produce the href
```
<a href-from-text="{{text}}"></a> <!-- href="mailto:azzamallow@github.com" -->
```

support
-------

* twitter handle (e.g. @azzamallow)
* mail address (e.g. azzamallow@github.com)
* www url (e.g. www.nba.com)
* any url (e.g. http://www.google.com)

If text cannot be identified, no href will be set
