lib
=======
This modules provides one class: 'Mould'.

setup
-----

    nail_properties = require '../lib/nail-properties.js'
    nail            = require('nail-core').use(
      require 'nail-extend'
      nail_properties
    )

Mould
-----
`Mould`is pretty useless when used alone but all classes extending it
allows setting all properties on initialization.

The `TestClass` extends the `Mould` class and has 2 properties.

    exports['setUp'] = (done) ->
      @classes = nail.to TestClass:
        extend: nail_properties.lib.Mould
        properties:
          sampleText:   "semper sit"
          sampleNumber: 12
      done()

If we create a instance without passing an argumentit will keep the defaul
values.

    exports['default values'] = (test) ->
      test.expect 2
      instance = new @classes.TestClass
      test.equal instance.sampleText(), "semper sit"
      test.equal instance.sampleNumber(), 12
      test.done()

Passing a object allows us to set all properties. The propery names in the
arguemnt must equal the propery names of the class.

    exports['init with object'] = (test) ->
      test.expect 2
      instance = new @classes.TestClass(sampleText: 'another one', sampleNumber: 9)
      test.equal instance.sampleText(), 'another one'
      test.equal instance.sampleNumber(), 9
      test.done()

A property which is not defined for this class can not be initialized this way.

    exports['error if not a class property'] = (test) ->
      test.expect 1
      dangerous = () ->
        instance = new @classes.TestClass(goto: 'pasta')
      test.throws dangerous
      test.done()