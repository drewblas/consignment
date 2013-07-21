module.exports = (app) ->
  class app.MessagesController

    # GET /messages/:id
    @show = (req, res) ->
      # TODO: This needs to be wrapped in a dependency that calls out to the recipient or something else where this
      # knowledge is encapsulated
      app.mongodb.collection('messages').findOne {_id: app.mongo.ObjectID(req.params.id)}, (err, result) ->
        if err
          res.json(500, err)
        else
          res.json(result)

    # POST /messages
    @create = (req, res) ->
      d = new app.Dispatcher(app, req)
      d.execute().done(
        (result) ->
          console.log "Result: " + result
          res.json(d.res)
        , (err) ->
          console.warn "Error in Dispatcher: #{error}"
          res.json(500, err)
      )
