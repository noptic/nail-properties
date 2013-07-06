subject = require('../lib/nail-properties.js')
nail = require('nail-core').use(subject)
_ = require("underscore")
module.exports =
  'structure':
    setUp: (done) ->
      done()

    'augment is a function': (test) ->
      test.expect 1
      test.ok (_.isFunction subject.augment),
        "module must export a 'augment' method"
      test.done()

  "get and set":
    setUp: (done) ->
      @classes = {}
      @classDefinition =
        properties:
          sampleText: "semper sit"
      nail.to @classes, 'test', testClass: @classDefinition
      @instance = new @classes.testClass()
      done()

    "method: 'get' exists": (test) ->
      test.expect 1
      test.ok (_.isFunction @instance.get), "'get' must be a function"
      test.done()

    "method: 'set' exists": (test) ->
      test.expect 1
      test.ok (_.isFunction @instance.set), "'set' must be a function"
      test.done()

    "get returns default value": (test) ->
      test.expect 1
      test.equal @instance.sampleText(), "semper sit",
        "Must return the default value"
      test.done()

    "combined get/set method created": (test) ->
      test.expect 2
      test.ok (_.isFunction @instance.sampleText),
        "'sampleText' must be a function"
      newText = "We are dead. Again"
      @instance.sampleText newText
      test.equal @instance.sampleText(), newText,
        "sampleText shouldbe '#{newText}'"
      test.done()