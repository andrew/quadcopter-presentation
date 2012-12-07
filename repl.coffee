arDrone = require("ar-drone")

drone = arDrone.createClient()

console.log 'takeoff'
drone.takeoff()

# drone
#   .after(3000, ->
#     console.log 'counterClockwise'
#     this.counterClockwise(0.3)
#   )
#   .after(3000, ->
#     console.log 'clockwise'
#     this.clockwise(0.3)
#   )
#   .after(3000, ->
#     console.log 'stop'
#     this.stop()
#     this.land()
#     console.log 'landed'
#   )

drone
  .after(2000, ->
    this.up(0.1)
  )
  .after(3000, ->
    this.animate('flipAhead', 15)
  )
  .after(3000, ->
    console.log 'stop'
    this.stop()
    this.land()
    console.log 'landed'
            
  )