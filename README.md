# README

這是一個藉由實作『黑白棋』遊戲來練習網站程式設計的專案。

主要想練習的功能是：多人畫面的即時更新。

## 實作方式

這個功能會分成幾個階段來實作：

1. 使用者可以隨時收到伺服器的訊息，並且看到更新後的瀏覽器畫面。
1. 使用 Pub/Sub 模式
1. 每個瀏覽器會訂閱遊戲房間的訊息。
1. 遊戲房間的訊息會包含遊戲的狀態，例如：遊戲開始、遊戲結束、玩家行動等。
1. 當遊戲房間的訊息有更新時，會發送給所有訂閱的瀏覽器。
1. 瀏覽器收到訊息後，會更新畫面。
1. 使用 Rails 的 ActionCable 來實作即時更新。
1. 一開始使用 Rails 的 View 來實作前端頁面，之後再改成前後端分離的架構。

## TechStack

- Ruby 3.3.0
- Rails 7.1.0
- PostgreSQL
- Redis (for ActionCable)

## This app should be able to:

### General

- [ ] Create a new room (who creates the room will be the owner of the room)
- [ ] Join a specific room
- [ ] Join a random room
- [ ] Leave a room
  - [ ] The other player will be the owner of the room
  - [ ] The room will be deleted if there is no player in it
- [ ] Enter the game (as a player)
- [ ] Watch the game (as a spectator)
- [ ] Exit the game

### Game

- [ ] Prepare the game -> (EVENT) Game is prepared
  - [ ] Choose the game size (8x8, 10x10, 12x12)
  - [ ] Choose the game mode (vs AI, vs Human)
  - [ ] Choose the game time (No time, 5 minutes, 10 minutes, etc.)
  - [ ] Choose the first player
    - [ ] Random
    - [ ] Manual selection
    - [ ] By the last loser
    - [ ] By the elo rating
- [ ] Start the game -> (EVENT) Game is started
  - [ ] Set the game state
    - [ ] Board
    - [ ] Players
    - [ ] Turn
    - [ ] Time
- [ ] Player's turn -> (EVENT) Player's turn begins
  - [ ] Notify the player
  - [ ] Rendering
    - [ ] All
      - [ ] Highlight the current player
      - [ ] Update the timer
    - [ ] Current player
      - [ ] Highlight the available moves
- [ ] Player action -> (EVENT) Player made an action
  - [ ] Validate the action
    - [ ] Check if the player is the current player
    - [ ] Check if the action is valid
  - [ ] Action
    - [ ] Pass the turn if no available move (Automated)
    - [ ] Pass the turn if the player's time is up (Automated)
    - [ ] Put a piece
    - [ ] Surrender (Game will end if the player surrenders, or both players can't put a piece)
- [ ] Player turn end -> (EVENT) Player's turn ends
  - [ ] If the player surrenders, the game will end
  - [ ] If both players can't put a piece, the game will end
  - [ ] Else
    - [ ] Update the game state
      - [ ] Board
      - [ ] Players
      - [ ] Turn
      - [ ] Time
    - [ ] Rendering
      - [ ] All
        - [ ] Update the board
        - [ ] Stop the timer
    - [ ] Next player's turn begins
- [ ] Game end -> (EVENT) Game is ended
  - [ ] Notify the players
  - [ ] Update the game state
    - [ ] Board
    - [ ] Players
    - [ ] Turn
    - [ ] Time
  - [ ] Rendering
    - [ ] All
      - [ ] Update the board
      - [ ] Stop the timer
      - [ ] Show the result
  - [ ] Save the game result
    - [ ] Winner
    - [ ] Loser
    - [ ] Reason
      - [ ] Surrender
      - [ ] Score
      - [ ] Tie (No winner or loser)
  - [ ] Update the player's elo rating
  - [ ] Next game preparation
  - [ ] Leave the game

## UI

- [ ] Anyone in the room can see the game state changes in real-time
- [ ] Use ActionCable for real-time updates
- [ ] Use noticed gem for notifications
- [ ] Use TailwindCSS for styling
- [ ] Use ActionCable for passing the player actions
- [ ] Provide RESTful API for player actions as convenience
