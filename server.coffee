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
        drone
          .after(3000, ->
            this.clockwise(0.7)
          )
          .after(3000, ->
            this.counterClockwise(0.7)
          )
          .after(3000, ->
            this.stop()
          )
      when 'counterClockwise'
        drone
          .after(3000, ->
            this.counterClockwise(0.7)
          )
          .after(3000, ->
            this.clockwise(0.7)
          )
          .after(3000, ->
            this.stop()
          )
      when 'down'
        drone
          .after(3000, ->
            this.down(0.2)
          )
          .after(3000, ->
            this.up(0.2)
          )
          .after(3000, ->
            this.stop()
          )
      when 'up'
        drone
          .after(3000, ->
            this.up(0.2)
          )
          .after(3000, ->
            this.down(0.2)
          )
          .after(3000, ->
            this.stop()
          )
      when 'flipAhead'
        drone
          .after(3000, ->
            this.up(0.2)
          )
          .after(3000, ->
            this.animate('flipAhead', 15)
          )
          .after(3000, ->
            this.stop()
          )
      when 'front'
        drone
          .after(3000, ->
            this.front(0.1)
          )
          .after(3000, ->
            this.back(0.1)
          )
          .after(3000, ->
            this.stop()
          )
      when 'back'
        drone
          .after(3000, ->
            this.back(0.1)
          )
          .after(3000, ->
            this.front(0.1)
          )
          .after(3000, ->
            this.stop()
          )
      when 'yawShake'
        drone.animate('yawShake', 15)
        drone.stop()
      when 'flipLeft'
        drone
          .after(3000, ->
            this.up(0.2)
          )
          .after(3000, ->
            this.animate('flipLeft', 15)
          )
          .after(3000, ->
            this.stop()
          )
      when 'land'
        drone.land()
      else
        # nothing
