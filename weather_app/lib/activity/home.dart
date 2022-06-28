import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:weather_app/activity/loading.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String username;
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    print('this is init state');
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('widget distroy');
  }

  @override
  Widget build(BuildContext context) {
    Map? info = ModalRoute.of(context)!.settings.arguments as Map?;
    String temp = ((info!['temp_value']).toString()).substring(0, 4);
    String icon = info['icon_value'];
    String getcity = info['city_value'];
    String hum = info['hum_value'];
    String air = ((info!['air_value']).toString()).substring(0, 4);
    String des = info['des_value'];

    var city_name = ["Mumbai", "Indore", "Delhi", "Barwani", "Pune"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.amber,
          )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.amber[50],
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text.replaceAll(" ", "")) ==
                              "") {
                            print('Blank Search');
                          } else
                            Navigator.pushNamed(context, '/loading',
                                arguments: {
                                  "searchText": searchController.text,
                                });
                        },
                        child: Container(
                          child: Icon(Icons.search),
                          margin: EdgeInsets.fromLTRB(2, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "$city"),
                      ))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network(
                                'http://openweathermap.org/img/wn/$icon@2x.png'),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                Text(
                                  '$des',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('In $city',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white.withOpacity(0.5)),
                          margin: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          padding: EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(WeatherIcons.thermometer_exterior),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$temp',
                                    style: TextStyle(
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'C',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.wind),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text('$air',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold)),
                            Text('km/hr', style: TextStyle(fontSize: 20))
                          ],
                        ),
                        height: 200,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5)),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text('$hum',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold)),
                            Text('Percent', style: TextStyle(fontSize: 20))
                          ],
                        ),
                        height: 200,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Create By Ankit Sanvedi",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
