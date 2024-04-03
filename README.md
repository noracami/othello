# README

This is a simple project implementing a game room with a game of Othello (Reversi) in it.

## TechStack

- Ruby 3.3.0
- Rails 7.1.0
- PostgreSQL
- Redis (for ActionCable)

## Milestones

- [ ] v1 use ActionCable for real-time updates
  - [ ] Test if 2 clients can see the same message at the same time
  - [ ] Determine how client (player) interacts with the server
    - [ ] By RESTful API
    - [ ] By ActionCable (Websocket)
- [ ] v2 game ends when one player surrenders
  - [ ] Create a new room
  - [ ] Enter the game
  - [ ] Surrender
  - [ ] Game ends
- [ ] v3 game logic and player profile
  - [ ] put a piece and transform the opponent's pieces
  - [ ] show the available moves
  - [ ] player owns a profile
- [ ] v4 game history
  - [ ] can replay the game
  - [ ] the game leader board
  - [ ] the game statistics
  - [ ] the player statistics

## Development plan

- [x] Setup CI/CD (On zeabur)
- [ ] Design API schema
- [ ] Design Models
- [ ] To be continued...

## This app should be able to:

### General

- Create a new room (creator will be the first player)
- Join a specific room
- Join a random room
- Leave a room
  - The other player will be the owner of the room
  - The room will be deleted if there is no player in it
- Enter the game (as a player)
- Watch the game (as a spectator)
- Exit the game

### Game

- Prepare the game -> (EVENT) Game is prepared
  - Choose the game size (8x8, 10x10, 12x12)
  - Choose the game mode (vs AI, vs Human)
  - Choose the game time (No time, 5 minutes, 10 minutes, etc.)
  - Choose the first player
    - Random
    - Manual selection
    - By the last loser
    - By the elo rating
- Start the game -> (EVENT) Game is started
  - Set the game state
    - Board
    - Players
    - Turn
    - Time
- Player's turn -> (EVENT) Player's turn begins
  - Notify the player
  - Rendering
    - All
      - Highlight the current player
      - Update the timer
    - Current player
      - Highlight the available moves
- Player action -> (EVENT) Player made an action
  - Validate the action
    - Check if the player is the current player
    - Check if the action is valid
  - Action
    - Pass the turn if no available move (Automated)
    - Pass the turn if the player's time is up (Automated)
    - Put a piece
    - Surrender (Game will end if the player surrenders, or both players can't put a piece)
- Player turn end -> (EVENT) Player's turn ends
  - If the player surrenders, the game will end
  - If both players can't put a piece, the game will end
  - Else
    - Update the game state
      - Board
      - Players
      - Turn
      - Time
    - Rendering
      - All
        - Update the board
        - Stop the timer
    - Next player's turn begins
- Game end -> (EVENT) Game is ended
  - Notify the players
  - Update the game state
    - Board
    - Players
    - Turn
    - Time
  - Rendering
    - All
      - Update the board
      - Stop the timer
      - Show the result
  - Save the game result
    - Winner
    - Loser
    - Reason
      - Surrender
      - Score
      - Tie (No winner or loser)
  - Update the player's elo rating
  - Next game preparation
  - Leave the game

## UI

- Anyone in the room can see the game state changes in real-time
- Use ActionCable for real-time updates
- Use noticed gem for notifications
- Use TailwindCSS for styling
- Use ActionCable for passing the player actions
- Provide RESTful API for player actions as convenience
