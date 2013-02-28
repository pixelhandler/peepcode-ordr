// Controllers

// Implement explicitly to use the object proxy.
App.TablesController = Ember.ArrayController.extend({
  sortProperties: ['id']
});

App.FoodController = Ember.ArrayController.extend({
  addFood: function(food) {
    var table = this.controllerFor('table').get('model'),
        tabItems = table.get('tab.tabItems');

    tabItems.createRecord({
      food: food,
      cents: food.get('cents')
    });
  }
});

