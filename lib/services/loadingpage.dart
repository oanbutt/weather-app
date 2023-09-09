import 'package:code/services/curentpage.dart';
import 'package:code/services/locationgetter.dart';
import 'package:code/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = 'ffe8dff7dd083e29faec71102085bc6d';
const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override

void initState() {
    // TODO: implement initState
    super.initState();
    collectingData();
  }
  
  void collectingData() async {

    LocationGet getLocation = LocationGet();
    await getLocation.locationGetting();

    
    Networking network = Networking(url: '$baseUrl?lat=${getLocation.latitude}&lon=${getLocation.longitude}&appid=$apiKey&units=metric');
    
    dynamic weather = await network.getWeatherData();

    Navigator.push(context, MaterialPageRoute(builder: (context) =>
      CurrentPage(currentWeather: weather),
    ));

    
    
  }







  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image:AssetImage('images/leafy.jpg'),
    fit: BoxFit.cover,
    )
    ),
        alignment: Alignment.center,
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
    ),
    );
  }
}
