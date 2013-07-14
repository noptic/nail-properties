# nail-properties
# https://github.com/noptic/nail-properties
#
# Copyright (c) 2013 noptic
# Licensed under the MIT license.

_ = require 'underscore'

helpers =
  get: (name) ->
    return @[name]
  set: (name,value) ->
    @[name] = value
    return this

module.exports =
  augment:  (newClass) ->
    if _.isUndefined(newClass::get)
      newClass::get = helpers.get
    if _.isUndefined(newClass::set)
      newClass::set = helpers.set

    newClass.definition.properties = newClass.definition.properties ? {}
    for name,defaultValue of newClass.definition.properties
      @api.addProperty newClass.prototype, name, defaultValue
    return this

  api:
    addProperty: (container, name, defaultValue = null)->
      escapedName = @escapeName name
      container[escapedName] = defaultValue
      container[name] = (value) ->
        if(arguments.length == 0)
          return @get escapedName
        else
          @set escapedName, value
          return this
      return this
    escapeName: (name) -> "_#{name}"

  lib:
    Mould: class Mould
      init:(properties) ->
        for name,value of properties
          @[name] value
        return this


