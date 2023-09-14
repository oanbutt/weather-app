import 'package:spring/spring.dart';
import 'package:code/services/conditions.dart';
import 'package:code/services/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../frostedglass.dart';
import '../frostedglass2.dart';
import  'package:intl/intl.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CurrentPage extends StatefulWidget {
  CurrentPage({required this.currentWeather});

  late dynamic currentWeather;

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage>{


  @override
  Conditions weatherCondition = Conditions();

  late int temperature;
  late String condition;
  late String conditionText;
  late int windSpeed;
  late int humidity;
  late int pressure;
  late dynamic time;
  late Image imageSetter;
   DateTime today = DateTime.now();

  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi(widget.currentWeather);
  }

  void updateUi(dynamic weatherDetail) {
    setState(() {
      if (weatherDetail == null) {

        temperature = 0;
        conditionText = 'Unclear';
        windSpeed = 0;
        humidity = 0;
        pressure = 0;
      }

      double temp = weatherDetail['main']['temp'];
      temperature = temp.toInt();
      var ct = weatherDetail['weather'][0]['id'];
      conditionText = weatherCondition.getText(ct);
      double wind = weatherDetail['wind']['speed'].toDouble();
      windSpeed = wind.toInt();
      humidity = weatherDetail['main']['humidity'];
      pressure = weatherDetail['main']['pressure'];
      imageSetter = weatherCondition.getImage(ct);



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
                          setState(() {
                            updateUi(widget.currentWeather);
                          });
                        },
                          child: Icon(
                        Icons.near_me,
                        shadows: [Shadow(blurRadius: 10,offset: Offset(2, 2))],
                        size: 40,
                        color: Color(0xffF5F2DA),
                      )),
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'CURRENT',
                            textStyle: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffF5F2DA),
                            ),
                            speed: const Duration(milliseconds: 200),
                          ),
                        ],
                        totalRepeatCount: 1,
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
                          });
                        },
                        child: Icon(
                          Icons.search,
                          shadows: [Shadow(blurRadius: 10,offset: Offset(2, 2))],
                          size: 40,
                          color: Color(0xffF5F2DA),
                        ),
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
                          child:
                          Spring.slide(
                              slideType: SlideType.slide_in_left,
                              withFade: true,
                              animDuration: Duration(seconds: 2),
                              child: imageSetter,
                          ),
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
    ;
  }
}
