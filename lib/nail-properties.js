(function() {
  var Mould, helpers, _;

  _ = require('underscore');

  helpers = {
    get: function(name) {
      return this[name];
    },
    set: function(name, value) {
      this[name] = value;
      return this;
    }
  };

  module.exports = {
    augment: function(newClass) {
      var defaultValue, name, _ref, _ref1;
      if (_.isUndefined(newClass.prototype.get)) {
        newClass.prototype.get = helpers.get;
      }
      if (_.isUndefined(newClass.prototype.set)) {
        newClass.prototype.set = helpers.set;
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
    lib: {
      Mould: Mould = (function() {
        function Mould() {}

        Mould.prototype.init = function(properties) {
          var name, value;
          for (name in properties) {
            value = properties[name];
            this[name](value);
          }
          return this;
        };

        return Mould;

      })()
    }
  };

}).call(this);
