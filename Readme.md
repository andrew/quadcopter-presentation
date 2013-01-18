# Quadcopter Presentation

An automated ignite style presentation that sends commands to a connected Parrot AR Drone via socket.io direct from the browser.

## Libraries

* slides - deck.js (https://github.com/imakewebthings/deck.js)
* webserver - express (https://github.com/visionmedia/express)
* websockets - socket.io (https://github.com/LearnBoost/socket.io)
* drone client - node-ar-drone (https://github.com/felixge/node-ar-drone)
* video streaming - node-dronestream (https://github.com/bkw/node-dronestream)

## Usage

1. git clone https://github.com/andrew/quadcopter-presentation

2. cd quadcopter-presentation

3. npm install

4. Connect to wifi on parrot ar drone

5. run `coffee server.coffee` in the root of the app

6. open `http://localhost:8080`

7. click to start presentation and stand back!

### Bonus

setup and run https://github.com/bkw/node-dronestream on port 3000 at the same time and you'll get a video stream from the drone in slide 15

see the `commands` array at the bottom of `views/index.ejs` for commands to be sent to the copter after each slide trasition, play with it to make your own scripted dances.

## Copyright

Copyright (c) 2013 Andrew Nesbitt. See [LICENSE](https://github.com/andrew/quadcopter-presentation/blob/master/LICENSE) for details.
