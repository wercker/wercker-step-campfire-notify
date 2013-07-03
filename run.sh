if [ ! -n "$WERCKER_CAMPFIRE_NOTIFY_TOKEN" ]; then
  error 'Please specify token property'
  exit 1
fi

if [ ! -n "$WERCKER_CAMPFIRE_NOTIFY_MESSAGE" ]; then
  error 'Please specify message property'
  exit 1
fi

if [ ! -n "$WERCKER_CAMPFIRE_NOTIFY_SUBDOMAIN" ]; then
  error 'Please specify subdomain property'
  exit 1
fi

if [ ! -n "$WERCKER_CAMPFIRE_NOTIFY_ROOM_ID" ]; then
  error 'Please specify room_id property'
  exit 1
fi


curl --user $WERCKER_CAMPFIRE_NOTIFY_TOKEN:x  -X POST -H "Content-Type: application/json" -d "{\"message\":{\"body\":\"$WERCKER_CAMPFIRE_NOTIFY_MESSAGE\", \"type\":\"TextMessage\"}}" https://$WERCKER_CAMPFIRE_NOTIFY_SUBDOMAIN.campfirenow.com/room/$WERCKER_CAMPFIRE_NOTIFY_ROOM_ID/speak
