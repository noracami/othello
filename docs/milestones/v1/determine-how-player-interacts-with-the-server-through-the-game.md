# Determine how player interacts with the server through the game

## Description

This milestone is about determining how the player interacts with the server through the game. We will decide if the player will interact with the server by RESTful API or by ActionCable (Websocket).

## RESTful API

The player can interact with the server by RESTful API. The player can send a request to the server to create a new room, join a specific room, join a random room, leave a room, enter the game, watch the game, and exit the game.

## ActionCable (Websocket)

The player can interact with the server by ActionCable (Websocket). The player can send a message to the server in real-time. The server can broadcast the message to all clients in the same room. The player can see the message in real-time.

## Differences

The RESTful API is a request-response protocol. The player sends a request to the server, and the server sends a response to the player. The player can interact with the server by sending a request to the server.

The ActionCable (Websocket) is a full-duplex communication protocol. The player can send a message to the server, and the server can broadcast the message to all clients in the same room. The player can see the message in real-time.

## Conclusion

We need the view (game state) to be updated in real-time. And the ActionCable (Websocket) is used for real-time updates.

Therefore, we will use ActionCable (Websocket) again to let player can send a message to the server.

The server can broadcast the message to all clients once the action is done. The player can see the game state changes in real-time.
