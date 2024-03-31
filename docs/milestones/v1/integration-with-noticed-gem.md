# Integration with Noticed gem

## Overview

In this milestone, we will integrate the Noticed gem to notify the players about the game state changes in real-time. We will use the ActionCable for real-time updates and the Noticed gem for notifications.

## Changes

- Add the Noticed gem to the Gemfile
- Create a new notification class for the game state changes
- Broadcast the notifications to the players

## Add the Noticed gem to the Gemfile

Add the Noticed gem to the Gemfile:

```ruby
# Gemfile
gem 'noticed'
```

And then run the following command to install the gem:

```bash
$ bundle install
```

## Create a new notification class for the game state changes

Create a new notification class for the game state changes:

```bash

$ rails generate noticed:model GameNotification
```

This will generate a new notification class in the `app/notifications` directory:

```ruby
# app/notifications/game_notification.rb
class GameNotification < Noticed::Base
  deliver_by :action_cable, channel: "GameChannel"
end
```

## Broadcast the notifications to the players

Broadcast the notifications to the players when the game state changes:

```ruby
# app/models/game.rb
class Game < ApplicationRecord
  after_commit :notify_players, on: [:create, :update]

  def notify_players
    GameNotification.with(game: self).deliver([player1, player2])
  end
end
```

## Conclusion

In this milestone, we integrated the Noticed gem to notify the players about the game state changes in real-time. We used the ActionCable for real-time updates and the Noticed gem for notifications. This will allow the players to see the game state changes in real-time and improve the overall gaming experience.
