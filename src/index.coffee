app = require('express')()
http = require('http').Server(app)
io = require('socket.io')(http)

app.get '/', (req, res) ->
  res.sendFile __dirname + '/index.html'

io.on 'connection', (socket) ->
  socket.on 'chat message', (msg) ->
    io.emit 'chat message', msg

http.listen 3000, ->
  console.log 'Listening on *:3000'
