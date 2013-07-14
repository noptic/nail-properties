About
=====
Adds properties to classes generated with nail.

setup
-----

    nail_properties = require '../lib/nail-properties.js'
    _               = require 'underscore'

augment
-------
Required function for all nail modules.

    exports['function: augment'] = (test) ->
      test.expect 1
      test.ok (_.isFunction nail_properties.augment),
        "module must export a 'augment' function"
      test.done()


lib
---
Contains classes defined by this module.

    exports['object: lib'] = (test) ->
      test.expect 1
      test.ok (_.isObject nail_properties.lib),
        "module must export a 'lib' object"
      test.done()

api
---
Reusable functions.

    exports['object: api'] = (test) ->
      test.expect 1
      test.ok (_.isObject nail_properties.api),
        "module must export a 'api' object"
      test.done()
