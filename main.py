from camplight import Request, Campfire

request = Request('https://your-subdomain.campfirenow.com', 'your_token')
campfire = Campfire(request)

account = campfire.account()
rooms = campfire.rooms()

room = campfire.room('Danger')
room.join()
room.speak('ohai')
room.leave()