# Log to console.log
util = require('util')

module.exports = email = (app, req, res) ->
  mail = {
    from: "Fred Foo ✔ <foo@blurdybloop.com>",
    to: "bar@blurdybloop.com, baz@blurdybloop.com",
    subject: "Hello ✔",
    text: JSON.stringify(simple_request(req)),
  }

  app.smtp.sendMail mail, (error, response) ->
    if error 
      console.warn error
    else
      console.log "Message sent: " + response.message

  return "email"