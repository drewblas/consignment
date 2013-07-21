filters = ->
recipients = ->

# TODO: Replace this with an auto-load

#########################################################
# Include all your filters here
#########################################################
filters.match_all = require("./filters/match_all")

#########################################################
# Include all your recipients here
#########################################################
recipients.log_msg        = require("./recipients/log_msg")
recipients.store_mongo    = require("./recipients/store_mongo")
recipients.email          = require("./recipients/email")
recipients.remote_example = require("./recipients/remote_example")

#########################################################
# Each action has a set of filters and a set of recipients
#########################################################
module.exports = workflow = {
    actions: [
      {
        name: "Log & store all"
        filters: [filters.match_all],
        recipients: [recipients.log_msg, recipients.store_mongo]
      }
    ]
  }