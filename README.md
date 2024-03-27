# README

This is a simple project implementing a game room with a game of Othello (Reversi) in it. The project is created to practice with the gem [noticed](https://github.com/excid3/noticed).

## TechStack

- Ruby 3.3.0
- Rails 7.1.0
- PostgreSQL
- Redis (for ActionCable)
- noticed (the project purpose)

## This app should be able to:

- Create a new room
- Join a specific room
- Join a random room
- Leave a room
- Start the game
- Determine the first player
  - by role (Owner or Guest)
  - by random
  - by manual selection
  - by the last loser
  - by the elo rating
- Game action
  - Put a piece
  - Pass the turn if and only if the player can't put a piece
  - Surrender (Game will end if the player surrenders, or both players can't put a piece)
- Close the room

## UI

- Anyone in the room can see the game state changes in real-time
- Use ActionCable for real-time updates
- Use noticed gem for notifications
- Use TailwindCSS for styling
- Use ActionCable for passing the player actions
- Provide RESTful API for player actions as convenience

## Development Schedule

- [ ] Setup CI/CD (On zeabur)
- [ ] POC for noticed gem
- [ ] Design API schema
- [ ] Design Models
- [ ] To be continued...
