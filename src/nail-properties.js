
module.exports.augment = function(newClass, definition, nail) {
  var name, value, _ref, _ref1,
    _this = this;
  newClass.prototype.get = function(name) {};
  newClass.prototype.set = function(name, value) {};
  _ref1 = (_ref = definition.properties) != null ? _ref : {};
  for (name in _ref1) {
    value = _ref1[name];
    newClass.prototype[name] = function(value) {
      if (arguments.length === 0) {
        return _this.get(name);
      } else {
        _this.set(name, value);
        return _this;
      }
    };
  }
  return this;
};
