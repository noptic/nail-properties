# nail-properties
# https://github.com/noptic/nail-properties
#
# Copyright (c) 2013 noptic
# Licensed under the MIT license.
module.exports.augment = (newClass,definition,nail) ->
  newClass::get = (name) ->
    return @['_'+name]
  newClass::set = (name,value) ->
    @['_'+name] = value
    return this
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
