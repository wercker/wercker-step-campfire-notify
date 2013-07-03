cd $WERCKER_STEP_ROOT
cd camplight
python setup.py install

cd $WERCKER_STEP_ROOT
python main.py

 # var token = os.Getenv("CAMPFIRE_TOKEN")
 #    var path string = "https://wercker.campfirenow.com/room/463743/speak"
 #    var authorizationHeader = "Basic " + toBase64(token + ":x")