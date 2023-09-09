import 'package:geolocator/geolocator.dart';


class LocationGet {
  late  double latitude;
  late double longitude;

  Future<void> locationGetting () async{
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('location cant be shown right now');
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        latitude = position.latitude;
        longitude = position.longitude;
      }
    } catch (e){
      print(e);
    }
  }







}