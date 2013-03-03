// Routes

// Router
App.Router.map(function () {
  this.resource('tables', function () {
    this.resource('table', {path:':table_id'});
  });
});

App.ApplicationRoute = Ember.Route.extend({
  setupController: function () {
    this.controllerFor('food').set('model', App.Food.find());
  }
});

App.IndexRoute = Ember.Route.extend({
  redirect: function () {
    this.transitionTo('tables');
  }
});

App.TablesRoute = Ember.Route.extend({
  model: function () {
    return App.Table.find();
  }
});

// Standard behavior, don't need the code...
//App.TableRoute = Ember.Route.extend({
  //model: function (params) {
    //debugger;
    //return App.Table.find(params.table_id);
  //},
  //setupController: function (controller, model) {
    //this._super(controller, model);
  //}
//});