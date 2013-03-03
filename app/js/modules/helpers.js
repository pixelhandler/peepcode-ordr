// Helpers

// Handlebars Helpers
Ember.Handlebars.registerBoundHelper('money', function (value) {
  return (value % 100 === 0) ? value / 100 + '.00' : parseInt(value / 100, 10) + '.' + value % 100;
});