{spawn, exec} = require 'child_process'

option '-p', '--prefix [DIR]', 'set the installation prefix for `cake install`'

async = require "async"
fs = require "fs"
path = require "fs"
_ = require "underscore"

stdout_handler = (data)->
  console.log data.toString().trim()

build = (watch)->
  console.log "Watching coffee scripts"

  options = ['-c', '-b', '-o', 'public/javascripts', 'public/coffeescripts']
  app_options = ['-c', '-o', 'public/javascripts/application', 'client']

  if watch is true
    options[0] = '-cw'
    app_options[0] = '-cw'

  coffee = spawn 'coffee', options 
  app = spawn 'coffee', app_options

  coffee.stdout.on 'data', stdout_handler
  app.stdout.on 'data', stdout_handler

style = (watch)->
  console.log "Watching stylesheets"

  options = ['--update', 'stylesheets:public/stylesheets']

  if watch is true
    options[0] = "--watch"

  sass = spawn 'sass', options

  sass.stdout.on 'data', (data)-> stdout_handler
  sass.stderr.on "data", (data)-> stdout_handler

buildTemplates = (callback) ->
  eco = require 'eco'
  compile = (name) ->
    (callback) ->
      fs.readFile "templates/#{name}.eco", "utf8", (err, data) ->
        if err then callback err
        else fs.writeFile "lib/templates/#{name}.js", eco.compile(data), callback

  async.parallel [
    compile("sample")
  ], callback

  
task 'templates', ->
  buildTemplates()

task 'style', (watch)->
  style watch

task 'build', 'build the project', (watch)->
  build watch

task 'watch', 'watch for changes and rebuild', ->
  build true
  style true
