(function() {
  var _;

  _ = require('underscore');

  module.exports = {
    augment: function(newClass) {
      var defaultValue, name, _ref, _ref1;
      if (_.isUndefined(newClass.prototype.get)) {
        newClass.prototype.get = this.generic.get;
      }
      if (_.isUndefined(newClass.prototype.set)) {
        newClass.prototype.set = this.generic.set;
      }
      newClass.definition.properties = (_ref = newClass.definition.properties) != null ? _ref : {};
      _ref1 = newClass.definition.properties;
      for (name in _ref1) {
        defaultValue = _ref1[name];
        this.api.addProperty(newClass.prototype, name, defaultValue);
      }
      return this;
    },
    api: {
      addProperty: function(container, name, defaultValue) {
        var escapedName;
        if (defaultValue == null) {
          defaultValue = null;
        }
        escapedName = this.escapeName(name);
        container[escapedName] = defaultValue;
        container[name] = function(value) {
          if (arguments.length === 0) {
            return this.get(escapedName);
          } else {
            this.set(escapedName, value);
            return this;
          }
        };
        return this;
      },
      escapeName: function(name) {
        return "_" + name;
      }
    },
    generic: {
      get: function(name) {
        return this[name];
      },
      set: function(name, value) {
        this[name] = value;
        return this;
      }
    }
  };

}).call(this);
