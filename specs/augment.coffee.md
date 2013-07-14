augment
=======
Augments nail classes with properties.

setup
-----

    nail_properties = require '../lib/nail-properties.js'
    _               = require 'underscore'
    nail            = require('nail-core').use(nail_properties)

This example creates a simple class `TestClass` with one property.
The propertys name is `sampleText` and it´s default value is `"semper sit"`.

    exports['setUp'] = (done) ->
      @classes = nail.to TestClass:
        properties:
          sampleText: "semper sit"

      @instance = new @classes.TestClass()
      done()

Nail will generate a comibend get/set method. Calling this function without an
argument returns the propery value

    exports['get'] = (test) ->
      test.expect 1
      test.equals @instance.sampleText(), "semper sit",
        'Calling sampleText without arguments must return "semper sit"'
      test.done()

Calling the function with an argument will change the propertys value and return
the object.

    exports['set'] = (test) ->
      test.expect 1
      @instance.sampleText('the new text')
      test.equals @instance.sampleText(), 'the new text',
        'The text must now be "the new text"'
      test.done()