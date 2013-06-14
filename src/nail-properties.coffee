# nail-properties
# https://github.com/noptic/nail-properties
#
# Copyright (c) 2013 noptic
# Licensed under the MIT license.
module.exports.augment = (newClass,definition,nail) ->
  newClass::get = (name) ->
    return @_properties[name]
  newClass::set = (name,value) ->
    @_properties[name] = value
    return this
  if !(newClass::_properties?)
    newClass::_properties = {}
  definition.properties = definition.properties ? {}
  for name,defaultValue of definition.properties
    newClass::['_'+name] = defaultValue
    newClass.prototype[name] = (value) ->
      if(arguments.length == 0)
        return @get name
      else
        @set name, value
        return @
  return this
