express = require 'express'
ejs = require 'ejs'
arDrone = require("ar-drone")

drone = arDrone.createClient()
app = express()

app.configure ->
  app.use(express.bodyParser())
  app.set('dirname', __dirname)
  app.use(app.router)
  app.use(express.static(__dirname + "/public/"))
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true}))
  app.set('views',__dirname + "/views/")

# server routes
app.get "/", (req,res) ->
  res.render 'index.ejs'

port = process.env.PORT || 8080
app.listen port
console.log "Listening on Port '#{port}'"

io = require("socket.io").listen(8081)
io.sockets.on "connection", (socket) ->
  socket.emit "news",
    hello: "world"

  socket.on "sendCommand", (data) ->
    console.log data
    command = data.command
    switch command
      when 'takeoff'
        drone.takeoff()
      when 'clockwise'
        drone.clockwise(0.5)
        drop.stop()
      when 'counterClockwise'
        drone.counterClockwise(0.5)
        drop.stop()
      when 'up'
        drone.up(0.5)
        drop.stop()
      when 'down'
        drone.down(0.5)
        drop.stop()
      when 'flipAhead'
        drone.flipAhead(15)
        drop.stop()
      when 'front'
        drone.front(0.5)
        drop.stop()
      when 'back'
        drone.back(0.5)
        drop.stop()
      when 'yawShake'
        drone.yawShake(15)
        drop.stop()
      when 'flipLeft'
        drone.flipLeft(15)
        drop.stop()
      when 'land'
        drone.land()
      else
        # nothing
