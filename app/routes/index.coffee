module.exports = (app) ->
  app.post '/messages', app.MessagesController.create
  app.get  '/messages/:id', app.MessagesController.show

  app.get '/ping', app.ApplicationController.ping

  # Error handling (No previous route found. Assuming it’s a 404)
  app.get '/*', (req, res) ->
    NotFound res

  NotFound = (res) ->
    res.render '404', status: 404, view: 'four-o-four'
