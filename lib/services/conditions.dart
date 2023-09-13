


import 'package:flutter/cupertino.dart';

class Conditions {

  String getText(int condition){
    if(condition >= 200 && condition <= 232){
      return 'Thunderstorm';
    }
    else if(condition >= 300 && condition <= 321){
      return 'Drizzle';
    }
    else if(condition >= 500 && condition <= 531){
      return 'Rainy';
    } else if(condition >= 600 && condition <= 622){
      return 'Snowy';
    }else if(condition >= 701 && condition <= 781){
      return 'musty';
    }else if(condition == 800){
      return 'Clear';
    }else if(condition > 800){
      return 'Cloudy';
    }else{
      return 'Unclear';
    }
  }

  Image getImage(int condition){
    if(condition >= 200 && condition <= 232){
     return Image(
        image: AssetImage('images/thundery.png'),
       height: 190,
       width: 220,
      );
    }
    else if(condition >= 300 && condition <= 321){
     return Image(
        image: AssetImage('images/drizzly.png'),
       height: 190,
       width: 220,
      );
    }
    else if(condition >= 500 && condition <= 531){
     return Image(
        image: AssetImage('images/rainsy.png'),
       height: 190,
       width: 220,
      );
    } else if(condition >= 600 && condition <= 622){
      return Image(
        image: AssetImage('images/snowy.png'),
        height: 190,
        width: 220,
      );
    }else if(condition >= 701 && condition <= 781){
      return Image(
        image: AssetImage('images/foggy.png'),
        height: 190,
        width: 220,
      );
    }else if(condition == 800){
      return Image(
        image: AssetImage('images/sundome2.png'),
        height: 190,
        width: 220,
      );
    }else if(condition > 800){
      return Image(
        image: AssetImage('images/cloudy.png'),
        height: 190,
        width: 220,
      );
    }else{
      return  Image(
        image: AssetImage('images/unclear.png'),
      );
    }
  }













}