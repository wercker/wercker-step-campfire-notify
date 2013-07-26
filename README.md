campfire-notify
===========================

Send a message to an Campfire room


Example
--------

Add CAMPFIRE_TOKEN as deploy target or application environment variable.

```
    - wouter/campfire-notify:
        token: $CAMPFIRE_TOKEN
        room-id: id
        subdomain: campfiresubdomain
        message: $WERCKER_APPLICATION_OWNER_NAME/$WERCKER_APPLICATION_NAME build by $WERCKER_STARTED_BY finished
```
