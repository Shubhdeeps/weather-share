import 'package:geolocator/geolocator.dart';

Future<Position> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  LocationPermission permission = await Geolocator.checkPermission();
  permission = await Geolocator.requestPermission();
  if (permission == LocationPermission.denied) {
    return Future.error("Location permission are denied!");
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error("Location permissions are permanently denied");
  }

  return await Geolocator.getCurrentPosition();
}
