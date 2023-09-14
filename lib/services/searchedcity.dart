import 'package:spring/spring.dart';
import 'package:code/services/conditions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../frostedglass.dart';
import '../frostedglass2.dart';

class SearchedCity extends StatefulWidget {
  SearchedCity({required this.searchedCity,required this.cityName});

  dynamic searchedCity;
  String cityName;


  @override
  State<SearchedCity> createState() => _SearchedCityState();
}

class _SearchedCityState extends State<SearchedCity> {

  @override
  DateTime today = DateTime.now();
  Conditions getCondition = Conditions();
  dynamic cityData;
  late int temperature;
  late String condition;
  late String conditionText;
  late int windSpeed;
  late int humidity;
  late int pressure;
  late dynamic time;
  late String cityHeading;
  late Image imageSetter;
  bool isPressed = false;


  void initState() {
    // TODO: implement initState
    super.initState();
    cityHeading = widget.cityName;
    updateCityUI(widget.searchedCity);
  }

  void updateCityUI(dynamic searchedCity) {
    setState(() {
      print(searchedCity);
      if (searchedCity == null) {

        cityHeading = 'ERROR';
        temperature = 0;
        conditionText = 'Unclear';
        windSpeed = 0;
        humidity = 0;
        pressure = 0;
      }

      double temp = searchedCity['main']['temp'];
      temperature = temp.toInt();
      var ct = searchedCity['weather'][0]['id'];
      conditionText = getCondition.getText(ct);
      double wind = searchedCity['wind']['speed'].toDouble();
      windSpeed = wind.toInt();
      humidity = searchedCity['main']['humidity'];
      pressure = searchedCity['main']['pressure'];
      imageSetter = getCondition.getImage(ct);

    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/beige.jpg'),
              fit: BoxFit.cover,
            )),
        alignment: Alignment.center,
        child: Padding(
          padding:
          const EdgeInsets.only(top: 40, bottom: 40, left: 30, right: 30),
          child: FrostedGlassBox(
            theWidth: double.infinity,
            theHeight: double.infinity,
            theChild: Padding(
              padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_rounded,
                          shadows: [Shadow(blurRadius: 10,offset: Offset(2, 2))],
                          size: 40,
                          color: Color(0xffF5F2DA),
                        ),
                      ),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            '${cityHeading.toUpperCase()}',
                            textStyle: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF5F2DA)
                            ),
                            speed: const Duration(milliseconds: 200),
                          ),
                        ],
                        totalRepeatCount: 1,
                      ),

                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 14),
                          child: Spring.slide(
                              slideType: SlideType.slide_in_left,
                              withFade: true,
                              animDuration: Duration(seconds: 2),
                              child: imageSetter),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$temperature',
                              style: TextStyle(
                                  fontSize: 50, color: Color(0xffF5F2DA)),
                            ),
                            Icon(Icons.circle_outlined,
                                size: 12, color: Color(0xffF5F2DA)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, top: 5),
                          child: Text(
                            '$conditionText',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Color(0xffF5F2DA)),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${DateFormat('EEEE').format(today)}, ',
                          style:
                          TextStyle(fontSize: 18, color: Color(0xffF5F2DA)),
                        ),
                        Text(
                          '${DateFormat('dd').format(today)} ',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xffF5F2DA)),
                        ),
                        Text(
                          '${DateFormat('MMMM').format(today)}',
                          style: TextStyle(
                              fontSize: 18, color: Color(0xffF5F2DA)),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FrostedGlassBox2(
                          myChild: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 26),
                                child: FaIcon(
                                  FontAwesomeIcons.wind,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 26),
                                child: Text(
                                  '$windSpeed',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xffF5F2DA)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 21),
                                child: Text(
                                  'Km/h',
                                  style: TextStyle(color: Color(0xffF5F2DA)),
                                ),
                              )
                            ],
                          ),
                        ),
                        FrostedGlassBox2(
                          myChild: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: FaIcon(
                                  FontAwesomeIcons.droplet,
                                  color: Colors.blue,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: Text(
                                  '$humidity',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xffF5F2DA)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  '%',
                                  style: TextStyle(
                                      color: Color(0xffF5F2DA), fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                        FrostedGlassBox2(
                          myChild: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 29),
                                child: FaIcon(
                                  FontAwesomeIcons.clock,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 23),
                                child: Text(
                                  '$pressure',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xffF5F2DA)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Text(
                                  'mmHg',
                                  style: TextStyle(
                                      color: Color(0xffF5F2DA), fontSize: 12),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
