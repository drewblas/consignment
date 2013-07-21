# Send the request as-is to a remote service

# This goes to 'mock.issues.com' with a 30 second timeout.
# However, it doesn't block the return of the response for 30 seconds

simple_request = require("#{__dirname}/../../lib/simple_request")
request = require('request');

module.exports = (app, req, res) ->
  doc = simple_request(req)
  
  request 'http://mock.isssues.com/timeout', (error, response, body) ->
    if error
      console.warn error
    else if response.statusCode == 200
      console.log "Remote response: " + response.body

  return "remote_example"
