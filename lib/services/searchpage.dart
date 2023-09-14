import 'package:code/services/citynetwork.dart';
import 'package:code/services/searchedcity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../constants.dart';
import '../frostedglass.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  late String searchedCity = '';
  late dynamic cityData;
  late dynamic weatherUpdate;
  late bool isPressed = false;
  final controller = TextEditingController();

  @override
  Future<dynamic> getCityData() async {
    try {
      CityNetworking network = CityNetworking(cityName: searchedCity);
      cityData = await network.getCityData();
      return cityData;
    } catch (e) {
      print(e);
    }
  }

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
                padding: const EdgeInsets.only(
                    top: 40, bottom: 40, left: 30, right: 30),
                child: FrostedGlassBox(
                  theWidth: double.infinity,
                  theHeight: double.infinity,
                  theChild: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 230,top: 15),
                          child: Icon(Icons.arrow_back_rounded,
                            shadows: [Shadow(blurRadius: 10,offset: Offset(2, 2))],
                            size: 40,
                            color: Color(0xffF5F2DA),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, right: 15, left: 15, bottom: 100),
                        child: TextField(
                          controller: controller,
                          style: TextStyle(
                            color: Color(0xffF5F2DA),
                          ),
                          decoration: kTextField.copyWith(
                            fillColor: Color(0xffF5F2DA).withOpacity(0.1),
                            suffixIcon: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  isPressed = true;
                                });
                                weatherUpdate = await getCityData();
                                if (weatherUpdate != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SearchedCity(
                                              searchedCity: weatherUpdate,
                                              cityName: searchedCity)));
                                  controller.clear();
                                  setState(() {
                                    isPressed = false;
                                  });
                                } else {
                                  final snackBar = SnackBar(
                                      content: Text('Invalid Input'),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () { controller.clear();
                                        setState(() {
                                          isPressed = false;
                                        });
                                        }
                                      ));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Icon(
                                Icons.search,
                                shadows: [
                                  Shadow(blurRadius: 10, offset: Offset(2, 2))
                                ],
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              searchedCity = value;
                            });
                          },
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        child: isPressed == true
                            ? SpinKitDoubleBounce(
                                color: Colors.white,
                                size: 70,
                              )
                            : null,
                      )
                    ],
                  ),
                ))));
  }
}
