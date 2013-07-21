# Store the object in mongo

# This is a 'synchronous' version that returns the document id as part of the response
# However, it will block until the write completes.  
# How else do you expect to return the _id of what you just wrote?

simple_request = require("#{__dirname}/../../lib/simple_request")
Q = require('q')

module.exports = store_mongo = (app, req, res) ->
  deferred = Q.defer()

  c = app.mongodb.collection('messages')

  doc = simple_request(req)

  c.insert doc, (err, docs) ->

    if err
      console.warn err.message
      deferred.reject(new Error(err))
    else
      console.log "Wrote to Mongo: " + doc._id
      res.id = doc._id
      deferred.resolve("mongo: " + doc._id)

  return deferred.promise