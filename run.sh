if [ ! -n "$WERCKER_CAMPFIRE_NOTIFY_TOKEN" ]; then
  error 'Please specify token property'
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



if [ ! -n "$WERCKER_CAMPFIRE_NOTIFY_FAILED_MESSAGE" ]; then
  if [ ! -n "$DEPLOY" ]; then
    export WERCKER_CAMPFIRE_NOTIFY_FAILED_MESSAGE="$WERCKER_APPLICATION_OWNER_NAME/$WERCKER_APPLICATION_NAME: build of $WERCKER_GIT_BRANCH by $WERCKER_STARTED_BY failed."
  else
    export WERCKER_CAMPFIRE_NOTIFY_FAILED_MESSAGE="$WERCKER_APPLICATION_OWNER_NAME/$WERCKER_APPLICATION_NAME: deploy to $WERCKER_DEPLOYTARGET_NAME by $WERCKER_STARTED_BY failed."
  fi
fi

if [ ! -n "$WERCKER_CAMPFIRE_NOTIFY_PASSED_MESSAGE" ]; then
  if [ ! -n "$DEPLOY" ]; then
    export WERCKER_CAMPFIRE_NOTIFY_PASSED_MESSAGE="$WERCKER_APPLICATION_OWNER_NAME/$WERCKER_APPLICATION_NAME: build of $WERCKER_GIT_BRANCH by $WERCKER_STARTED_BY passed."
  else
    export WERCKER_CAMPFIRE_NOTIFY_PASSED_MESSAGE="$WERCKER_APPLICATION_OWNER_NAME/$WERCKER_APPLICATION_NAME: deploy to $WERCKER_DEPLOYTARGET_NAME by $WERCKER_STARTED_BY passed."
  fi
fi

if [ "$WERCKER_RESULT" = "passed" ]; then
  export WERCKER_CAMPFIRE_NOTIFY_MESSAGE="$WERCKER_CAMPFIRE_NOTIFY_PASSED_MESSAGE"
else
  export WERCKER_CAMPFIRE_NOTIFY_MESSAGE="$WERCKER_CAMPFIRE_NOTIFY_FAILED_MESSAGE"
fi


if [ "$WERCKER_CAMPFIRE_NOTIFY_ON" = "failed" ]; then
  if [ "$WERCKER_RESULT" = "passed" ]; then
    echo "Skipping.."
    return 0
  fi
fi


curl --user $WERCKER_CAMPFIRE_NOTIFY_TOKEN:x  -X POST -H "Content-Type: application/json" -d "{\"message\":{\"body\":\"$WERCKER_CAMPFIRE_NOTIFY_MESSAGE\", \"type\":\"TextMessage\"}}" https://$WERCKER_CAMPFIRE_NOTIFY_SUBDOMAIN.campfirenow.com/room/$WERCKER_CAMPFIRE_NOTIFY_ROOM_ID/speak
