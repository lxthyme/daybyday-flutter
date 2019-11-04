# flutter emulators --launch Pixel_2_API_28
cd 'd:\360MoveData\Desktop\Demo\flutter_hw'

# flutter emulators --launch Nexus_5X_API_29_x86
flutter emulators --launch Pixel_2_API_25 --enable-software-rendering

flutter run

# iPhone 6p
flutter run -d b64400aef421b14dc8336abf95fade98fe4fc508 lib/ex/list.dart --track-widget-creation
# iPhone XS
flutter run -d DB624845-457A-4ACD-BCBD-DE6B89B3ABB0 lib/ex/demo.dart --track-widget-creation




#### MAC
open -a Simulator
