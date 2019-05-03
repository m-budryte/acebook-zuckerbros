# Learning Plan

1. 2-day sprints with a detailed feedback for each member of the team
2. Concentrate on the Agile practices
3. Self-directed learning until 11am
4. Breaks and sleep is important - finish at 5pm, break for lunch
5. Stand-ups at 9:45, Retros at 16:45 daily
6. One feature - one branch
7. Don't approve/push your own PRs - let someone to review it
8. Make an effort to do a proper code review
9. The master branch should always pass Travis CI
10. Delete your branch when you're finished with the feauture

# Action Cable

WebSocket protocol - complement to HTTP

- create a persistent connection between servers and clients

The Message model (Listing 3) includes a text field called content with a presence validation, as well as a named scope to ensure that the messages for display appear with most-recent last (at the bottom of the chat) and a maximum of 50.

```ruby
class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  scope :for_display, -> { order(:created_at).last(50) }
end
```

Need JS and JQuery

- with messages i need to append the new messages at the end of the div - CSS id message-table
- Select the dom element
- but have to wait for the DOM to load to append messages

## Action cable

There are only three main steps needed to convert the base app to a working Action Cable chat app:

Make a channel to handle WebSocket connections on the server side (local server in development, Heroku in production).

`$ rails generate channel Room`
This generates a

- app/channels/room_channe.rb
- app/assets/javascript/cable.js
- app/assets/javascript/channels/room.coffee
  `$ rails db:migrate:reset && rails db:seed`

Room_channel.rb

- action cable works by subscribing an user to a channel
- this action allows that user's browser to be updated via a WebSocket
- subscribed and unsubscribed methods are callbacks
- this allows us to take actin whenever either of them is called
- server needs to be restarted to reload action cable
- to send data to the subscribers channel is to use the server's broadcast method in the controller

`ActionCable.server.broadcast 'room_channel', <data hash>`

- update Message controller's create action

Make a CoffeeScript program (room.coffee) for the chat room on the client side (web browser).

Update the Messages controller create action to broadcast changes to the channel instead of redirecting or rendering.

**Flexbox:**
define container:
.container {
display:flex
height: 100vh //stretches the entire height of the view
}

- goes all away across the page

inlineflex wraps around the content

- by defining container as flex, all the children of the container become flex items

### Flex direction

flex-direction:row
flex-direction:column

- row is default
- column : stacks flex boxes vertically

Here we have 2 main axeses
Default:

- main axis when is row is left to right
- cross axis goes top to bottom when in

Column:

- main axis is top to bottom

There is reverse

- column-reverse
- row-reverse

Flex wrap

- givin elements widths
- can select individual flex items - individual items in the container flex

Order property - put ont he class
order: 1
order: 2

Alignment

justify content - alignment of items on main axis
justify-content: space-between
justify-content: center
justify-content: flex-end
justify-content: flex-start

Inline items

- give height to container

Can use:

- align-items:center
- align-items:stretch
- align-items:flex-end
- align-items:flex-start
- align-items:baseline (looks at text and aligns bottom of text)

Align content

- only works when we have multiple lines

Align-self = can apply yo infividual items insteand on the same container

Felxbox sizing:
box {
flex: ; //proportion of scaling up or down
}

Flex-grow:1 - divided extra space between everyone
Flex-shrink:1 -divide extra space equally
flex-basis:400px

box1{
flex-basis:400px;
flex-grow:1; //this will take the resto fo the space
}

//How to deal with extra space - use flex-grow

box2 {
flex-basis:400px;
flex-grow:0
}

Default for flexbox is to divide equally
flex-shrink:5 - this is t times smaller than the other one
flex-shrink:1

We can do it like this
flex: 10(grow) 5(shring) (basis)
