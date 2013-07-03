from camplight import Request, Campfire


subdomain = ""
request = Request('https://' + subdomain + '.campfirenow.com', 'your_token')
campfire = Campfire(request)

account = campfire.account()
rooms = campfire.rooms()

room = campfire.room('Danger')
room.join()
room.speak('ohai')
room.leave()