# Excecuted for every incoming message

Q = require('q')
workflow = require("./workflow")

module.exports = class Dispatcher
    constructor: (app, req) ->
      @app = app
      @req = req
      @res = {matches: []}

    execute: ->
      promises = []

      for action in workflow.actions
        # Only continue if all filters match
        cont = true
        
        for filter in action.filters
          cont = false unless filter(@app, @req)

        if cont
          @res.matches += action.name
        
          for recipient in action.recipients
            promises.push Q(recipient(@app, @req, @res))

      return Q.all(promises)