lib
===
This modules provides one api function: `addProperty(container, name, defaultValue)`.

setup
-----

    nail_properties = require '../lib/nail-properties.js'
    nail = require('nail-core').use(nail_properties)

addProperty(container, name, defaultValue)
------------------------------------------
Adds a combined get/set method to a object at runtime.
The object must implement `get(propertyName)` and
`set(propertyName, propertyValue)` methods.

    exports['add a property'] = (test) ->
      test.expect 1

      myObject = {
        get: (name) ->
          @[name]
        set: (name,value) ->
          @[name] = value;
          return this
      }

      nail_properties.api.addProperty myObject, 'myProperty', 'the default value'
      test.equals myObject.myProperty(), 'the default value'
      test.done()

