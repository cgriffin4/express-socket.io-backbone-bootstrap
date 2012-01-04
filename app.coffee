
# Module dependencies

express = require('express')
routes = require('./routes')

app = module.exports = express.createServer()
io = require('socket.io').listen(app)

# Configuration

app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(__dirname + '/public')

app.configure 'development', ->
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )

app.configure 'production', ->
  app.use express.errorHandler()

io.configure ->
  io.set 'transports', [ 'websocket' ]
  io.set 'log level', 1

# Routes

app.get '/', routes.index

# Sockets

io.sockets.on 'connection', (socket) ->
  socket.emit 'events',
    hello: 'world'

  socket.on 'events', (data) ->
    console.log data

port = process.env.PORT or 3000
app.listen port
console.log "Listening on port #{ port } in #{ app.settings.env } mode"
