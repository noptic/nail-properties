# nail-properties
# https://github.com/noptic/nail-properties
#
# Copyright (c) 2013 noptic
# Licensed under the MIT license.
module.exports.augment = (newClass,definition,nail) ->
  newClass::get = (name) ->
    return @[name]
  newClass::set = (name,value) ->
    @[name] = value
    return this
  definition.properties = definition.properties ? {}
  for name,defaultValue of definition.properties
    escapedName = '_'+name
    newClass::[escapedName] = defaultValue
    newClass.prototype[name] = (value) ->
      if(arguments.length == 0)
        return @get escapedName
      else
        @set escapedName, value
        return @
  return this
