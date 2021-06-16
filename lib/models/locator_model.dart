import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class LocatorModel {
  final Geolocator geolocator = Geolocator();
  Position userLocaton;
  var currentLocation;
  var lat;
  var long;
  var address;

  getLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;
    final coordinates = Coordinates(position.latitude, position.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    return [address = addresses.first.subAdminArea, lat, long];
  }
}
