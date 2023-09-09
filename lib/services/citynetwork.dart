import 'dart:convert';
import 'package:code/services/loadingpage.dart';
import 'package:http/http.dart' as http;


class CityNetworking {

  CityNetworking({required this.cityName});

  late String cityName;

  Future getCityData() async {
    http.Response response = await http.get(
        Uri.parse('$baseUrl?q=$cityName&appid=$apiKey&units=metric'));
    if (response.statusCode == 200) {
      dynamic data = response.body;
      dynamic decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}

