import 'package:http/http.dart' as http;
import 'dart:convert';

class worker {
  late String location;

//constructor
  worker({required this.location}) {
    location = this.location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;

//method
  Future<void> getData() async {
    try {
      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=b0335770caade83eda4306a3dd545a4a");
      var Response = await http.get(url);
      Map data = jsonDecode(Response.body);

//Getting Temp, Humidity,
      Map temp_data = data['main'];
      double getTemp = temp_data['temp'] - 273.15;
      String getHumidity = temp_data['humidity'].toString();

// air_speed
      Map wind = data['wind'];
      double getAir_speed = wind['speed'] / 0.277777777777778;

//Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data['description'];

      //Assigning Values
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data['icon'].toString();
    } catch (e) {
      temp = "N/A";
      humidity = "N/A";
      air_speed = "N/A";
      description = "N/A";
      main = "N/A";
      icon = "N/A";
    }
  }
}
