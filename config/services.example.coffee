module.exports = (app) ->
  nodemailer = require('nodemailer')

  app.smtp = nodemailer.createTransport("SMTP",{
    service: "mandrill",
    auth: {
      user: process.env.MANDRILL_USERNAME,
      pass: process.env.MANDRILL_PASSWORD
    }
  })

  if process.env.MONGOHQ_URL
    app.mongo = require('mongoskin')
    app.mongodb = app.mongo.db(process.env.MONGOHQ_URL, {
      auto_reconnect: true,
      poolSize: 1,
      w: 1,
      safe: true,
      strict: false
    })
