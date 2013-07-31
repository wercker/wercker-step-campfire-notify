# campfire-notify

Send a message to an Campfire room

## Options

### required

* `token` - Your Campfire token.
* `room-id` - The id of the Campfire room.
* `subdomain` - The Campfire subdomain.

### optional

* `passed-message` - Use this option to override the default passed message.
* `failed-message` -  Use this option to override the default failed message.
* `on` - Possible values: `always` and `failed`, default `always`



Example
--------

Add CAMPFIRE_TOKEN as deploy target or application environment variable.


    build:
        after-steps:
            - campfire-notify:
                token: $CAMPFIRE_TOKEN
                room-id: id
                subdomain: campfiresubdomain


