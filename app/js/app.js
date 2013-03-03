var require = minispade.require;

require("jquery-1.8.3.min");
require("handlebars-1.0.0.rc.2");
require("ember");
require("ember-data");

/*global App*/
window.App = Ember.Application.create();

// Templates
require("_tableMenu_template");
require("application_template");
require("food_template");
require("tab_template");
require("table_template");
require("tables_template");
require("tables/index_template");

// Application
require("routes");
require("controllers");
require("helpers");
require("models");
require("views");
require("fixtures");
