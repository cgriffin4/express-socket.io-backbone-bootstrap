async = require "async"
fs = require "fs"
{print} = require 'util'
{spawn, exec} = require 'child_process'


task 'watch', 'Watch for changes and rebuild', ->
  options = ['-cw', '-b', '-o', 'public/javascripts', 'src']

  coffee = spawn 'coffee', options

  coffee.stdout.on 'data', (data)->
    print data.toString()

task 'start', 'Start server', ->
  app = spawn 'coffee', ['-w', 'app.coffee']
  app.stdout.on 'data', (data)->
    print data.toString()

  options = ['-cw', '-b', '-o', 'public/javascripts', 'src']

  coffee = spawn 'coffee', options

  coffee.stdout.on 'data', (data)->
    print data.toString()

