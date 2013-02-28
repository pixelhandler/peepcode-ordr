var require = minispade.require;

require("jquery-1.8.3.min");
require("handlebars-1.0.0.rc.2");
require("ember");
require("ember-data");

/*global App*/
window.App = Ember.Application.create();

require("routes");
require("controllers");
require("helpers");
require("models");
require("views");
require("fixtures");
