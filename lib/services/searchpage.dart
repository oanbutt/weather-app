import 'package:code/services/citynetwork.dart';
import 'package:code/services/searchedcity.dart';
import 'package:flutter/material.dart';
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

  @override


  Future<dynamic> getCityData ()async{
    try{
      CityNetworking network = CityNetworking(cityName: searchedCity);
      cityData = await network.getCityData();
      return cityData;
    }catch (e){
      AlertDialog(
        title: Text('ERROR'),
        content: Text('invalid value entered'),
        // actions: [
        //   GestureDetector(
        //     onTap: (){
        //       Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
        //     },
        //     child: Text('ok'),
        //   )
        // ],
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/leafy.jpg'),
              fit: BoxFit.cover,
            )),
            alignment: Alignment.center,
            child: Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 40, left: 30, right: 30),
                child: FrostedGlassBox(
                  theWidth: double.infinity,
                  theHeight: double.infinity,
                  theChild: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.green,
                      ),
                      decoration: kTextField.copyWith(
                        fillColor: Colors.white.withOpacity(0.1),
                        suffixIcon: GestureDetector(
                          onTap: () async{
                            weatherUpdate = await getCityData();
                           if(weatherUpdate!=null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchedCity(
                                          searchedCity: weatherUpdate,
                                          cityName: searchedCity)));
                            }else {
                              final snackBar = SnackBar(
                                content: Text('Invalid Input'),

                                action: SnackBarAction(

                                  label: 'Undo',
                                  onPressed: ()=>Navigator.pop(context),
                                )
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);

                           }
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),

                      ),
                      onChanged: (value) {
                        setState(() {
                          searchedCity =value;
                        });
                      },
                    ),
                  ),
                ))));
  }
}
