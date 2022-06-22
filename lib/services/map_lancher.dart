//import 'package:maps_launcher/maps_launcher.dart';

// lanchMap() {
//   MapsLauncher.launchCoordinates(22.7010, 90.3535, 'Barishal');
// }


 import 'package:url_launcher/url_launcher.dart';

 openMap(latitude, longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }