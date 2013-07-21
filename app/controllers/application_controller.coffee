module.exports = (app) ->
  class app.ApplicationController

    @ping = (req, res) ->
      res.json({message: "pong"})
