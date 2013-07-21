module.exports = (req) ->
  {
    headers: req.headers,
    body: req.body,
    query: req.query,
    params: req.params,
    ip: req.ip,
    ts: new Date()
  }
