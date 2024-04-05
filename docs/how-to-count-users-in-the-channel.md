# How to count users in the channel

```ruby
channel_name = 'chat_room_channel'

broadcaster = ActionCable.server.broadcaster_for(channel_name)
```
