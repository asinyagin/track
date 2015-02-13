app = require './app'
debug = require('debug')('track')
http = require 'http'

normalizePort = (val) ->
  port = parseInt(val, 10)

  if isNaN port then val
  else if port >= 0 then port
  else false

onError = (error) ->
  if error.syscall != 'listen' then throw error

  bind = if typeof port == 'string'
    "Pipe #{port}"
  else
    "Port #{port}"

  switch error.code
    when 'EACCESS'
      console.error "#{bind} requires elevated priviliges"
      process.exit(1)
    when 'EADDRINUSE'
      console.error "#{bind} is already in use"
      process.exit(1)
    else
      throw error

onListening = ->
  addr = server.address()
  bind = if typeof addr == 'string'
    "pipe #{addr}"
  else
    "port #{addr.port}"
  debug "Listening on #{bind}"

port = normalizePort(process.env.PORT || '3000');
app.set('port', port)

server = http.createServer(app)

server.listen(port)
server.on('error', onError)
server.on('listening', onListening)
