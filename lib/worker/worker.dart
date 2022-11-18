// ignore_for_file: unnecessary_this, prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types, import_of_legacy_library_into_null_safe

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class worker{

  var location;
  worker(this.location){
    location=this.location;
  }


  var temperature;
  var humidity;
  var air_speed;
  var description;
  var icon;

  // method
  var app_id='9ad025c766e1cc610dd3406cce8f6272';
  Future<void> GetData () async
  {
    try {
      String lolu ='https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$app_id';

     http.Response response = await http.get(Uri.parse(lolu));
      Map data = jsonDecode(response.body);

      double temperature1 = data['main']['temp']- 273;
      var air_speed1 = data['wind']['speed'];
      var humidity1 = data['main']['humidity'];
      var location1 = data['name'];
      var description1 = data['weather'][0]['description'];



      // Get Data

      // Assigning
      location = location1;
      temperature = temperature1.toStringAsFixed(2);
      humidity = humidity1;
      air_speed = air_speed1;
      description = description1;
      icon= data['weather'][0]['icon'];
      // print(icon);

    }
    catch (e) {
      location = 'NA';
      temperature = 'NA';
      humidity = 'NA';
      air_speed = 'NA';
      description = 'Error Occured';
      icon='50d';
    }
  }
}