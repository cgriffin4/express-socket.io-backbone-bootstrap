
window.App = {
  Collections: {},
  Models: {},
  Views: {}
};

App.ChromeView = Backbone.View.extend({
  el: 'body',
  template: function() {
    var template;
    template = _.template("<div class='topbar'></div>\n<div class='container'>\n  <div class='content'></div>\n  <footer>\n    <p>&copy; Company 2011</p>\n  </footer>\n</div>");
    return template.apply(this, arguments);
  },
  initialize: function() {
    return this.render();
  },
  render: function() {
    $(this.el).html(this.template());
    App.topBarView = new App.TopBarView;
    return App.contentView = new App.ContentView;
  }
});

App.TopBarView = Backbone.View.extend({
  el: '.topbar',
  template: function() {
    var template;
    template = _.template("<div class=\"fill\">\n  <div class=\"container\">\n    <a href=\"#\" class=\"brand\">\n      <%= title %>\n    </a>\n    <ul class=\"nav\">\n      <% for (i in links) { %>\n        <li>\n          <a href=\"#\"><%= links[i].desc %></a>\n        </li>\n      <% } %>\n    </ul>\n  </div>\n</div>");
    return template.apply(this, arguments);
  },
  initialize: function() {
    return this.render();
  },
  render: function() {
    $(this.el).html(this.template({
      title: 'Chassis',
      links: [
        {
          desc: 'Home'
        }, {
          desc: 'About'
        }, {
          desc: 'Contact'
        }
      ]
    }));
    return $('ul.nav li').first().attr('class', 'active');
  }
});

App.ContentView = Backbone.View.extend({
  el: '.content',
  template: function() {
    var template;
    template = _.template("<div class='page-header'>\n  <h1>\n    <%= title %>\n  </h1>\n</div>\n<div class='row'>\n  <div class='span10'>\n    <h2>Main Content</h2>\n  </div>\n  <div class='span4'>\n    <h3>Secondary Content</h2>\n  </div>\n</div>");
    return template.apply(this, arguments);
  },
  initialize: function() {
    return this.render();
  },
  render: function() {
    return $(this.el).html(this.template({
      title: 'Chassis'
    }));
  }
});

App.Router = Backbone.Router.extend({
  routes: {
    "": "default"
  },
  initialize: function() {},
  "default": function() {
    return App.chromeView = new App.ChromeView;
  }
});
