


class Conditions {

  String getText(int condition){
    if(condition < 300){
      return 'Thunderstorm';
    }else if(condition >= 300){
      return 'Drizzle';
    }else if(condition >= 500){
      return 'Rainy';
    } else if(condition >= 600){
      return 'Snowy';
    }else if(condition >= 700){
      return 'Foggy';
    }else if(condition == 800){
      return 'Clear';
    }else if(condition > 800){
      return 'Cloudy';
    }else{
      return 'Unclear';
    }


  }











}