# Log to console.log
simple_request = require("#{__dirname}/../../lib/simple_request")


module.exports = log_msg = (app, req, res) ->
  console.log "Recieved: " + JSON.stringify(simple_request(req))
  return "log_msg"