// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:weather_app/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String temp;
  late String humi;
  late String air;
  late String des;
  late String main;
  late String icon;
  late String city = 'Barwani';

  void startApp() async {
    worker instance = worker(location: city);
    await instance.getData();
    temp = instance.temp;
    humi = instance.humidity;
    air = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'temp_value': temp,
        'hum_value': humi,
        'air_value': air,
        'des_value': des,
        'main_value': main,
        'icon_value': icon,
        'city_value': city,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)!.settings.arguments as Map;
    city = search['searchText'];
    if (search?.isNotEmpty ?? false) {
      city = search['searchText'];
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("images/weather.png"),
            ),
            Text(
              "Weather App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            SpinKitWave(
              color: Colors.black54,
              size: 30.0,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Made By Ankit Sanvedi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.amber[50],
    );
  }
}
