module.exports = (app) ->
  # Helpers
  app.helpers = require "#{__dirname}/../app/helpers"

  # Lib
  app.helpers.autoload "#{__dirname}/../lib", app

  # Controllers
  app.helpers.autoload "#{__dirname}/../app/controllers", app

  # Dispatcher
  app.Dispatcher = require("#{__dirname}/../dispatch/dispatcher")

  require("#{__dirname}/../config/services.coffee")?(app)
