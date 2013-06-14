(function() {

  module.exports.augment = function(newClass, definition, nail) {
    var defaultValue, name, _ref, _ref1;
    newClass.prototype.get = function(name) {
      return this._properties[name];
    };
    newClass.prototype.set = function(name, value) {
      this._properties[name] = value;
      return this;
    };
    if (!(newClass.prototype._properties != null)) {
      newClass.prototype._properties = {};
    }
    definition.properties = (_ref = definition.properties) != null ? _ref : {};
    _ref1 = definition.properties;
    for (name in _ref1) {
      defaultValue = _ref1[name];
      newClass.prototype['_' + name] = defaultValue;
      newClass.prototype[name] = function(value) {
        if (arguments.length === 0) {
          return this.get(name);
        } else {
          this.set(name, value);
          return this;
        }
      };
    }
    return this;
  };

}).call(this);
