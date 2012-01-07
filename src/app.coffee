window.App =
  Collections: {}
  Models: {}
  Views: {}

App.ChromeView = Backbone.View.extend
  el: 'body'

  template: ()->
    template = _.template """
      <div class='topbar'></div>
      <div class='container'>
        <div class='content'></div>
        <footer>
          <p>&copy; Company 2011</p>
        </footer>
      </div>
    """
    template.apply(this, arguments)

  initialize: ()->
    @render()

  render: ()->
    $(@el).html @template()
    App.topBarView = new App.TopBarView
    App.contentView = new App.ContentView

App.TopBarView = Backbone.View.extend
  el: '.topbar'

  template: ()->
    template = _.template """
      <div class="fill">
        <div class="container">
          <a href="#" class="brand">
            <%= title %>
          </a>
          <ul class="nav">
            <% for (i in links) { %>
              <li>
                <a href="#"><%= links[i].desc %></a>
              </li>
            <% } %>
          </ul>
        </div>
      </div>
    """
    template.apply(this, arguments)

  initialize: ()->
    @render()

  render: ()->
    $(@el).html @template
        title: 'Chassis'
        links: [
          { desc: 'Home' }
          { desc: 'About' }
          { desc: 'Contact' }
        ]

    $('ul.nav li').first().attr('class', 'active')

App.ContentView = Backbone.View.extend
  el: '.content'

  template: ()->
    template = _.template """
      <div class='page-header'>
        <h1>
          <%= title %>
        </h1>
      </div>
      <div class='row'>
        <div class='span10'>
          <h2>Main Content</h2>
        </div>
        <div class='span4'>
          <h3>Secondary Content</h2>
        </div>
      </div>
    """
    template.apply(this, arguments)

  initialize: ()->
    @render()

  render: ()->
    $(@el).html @template
      title: 'Chassis'

App.Router = Backbone.Router.extend
  routes:
    "": "default"

  initialize: ()->

  default: ()->
    App.chromeView = new App.ChromeView
