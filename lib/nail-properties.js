(function() {

  module.exports.augment = function(newClass, definition, nail) {
    var defaultValue, escapedName, name, _ref, _ref1;
    newClass.prototype.get = function(name) {
      return this[name];
    };
    newClass.prototype.set = function(name, value) {
      this[name] = value;
      return this;
    };
    definition.properties = (_ref = definition.properties) != null ? _ref : {};
    _ref1 = definition.properties;
    for (name in _ref1) {
      defaultValue = _ref1[name];
      escapedName = '_' + name;
      newClass.prototype[escapedName] = defaultValue;
      newClass.prototype[name] = function(value) {
        if (arguments.length === 0) {
          return this.get(escapedName);
        } else {
          this.set(escapedName, value);
          return this;
        }
      };
    }
    return this;
  };

}).call(this);
