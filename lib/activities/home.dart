// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, unused_local_variable, unnecessary_new, unnecessary_string_interpolations, avoid_unnecessary_containers, sort_child_properties_last, non_constant_identifier_names

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var city_name = [
      "Mumbai",
      "Lucknow",
      "New Delhi",
      "London",
      "Ottawa",
      "Amsterdam",
      "Beijing"
    ];
    // Map info= ModalRoute.of(context)!.settings.arguments as Map;
    final random = new Random();
    var city = city_name[random.nextInt(city_name.length)];
    // data will be retreived inside this build method because we need context and context of this home will be used.
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String city_name1 = info['locate_value'];
    String icon = info['icon_value'];
    String temp = info['temp_value'];
    String hum = info['humid_value'];
    String air_speed = info['air_speed_value'];
    String decrip = info['descrip_value'];

    return SizedBox(
    
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.lightBlue,
            ),
            preferredSize: Size.fromHeight(0)),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                //   Colors.lightBlue,
                Colors.lightBlueAccent,
                Colors.green
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // this container is for search bar
                Expanded(// coool
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(17),
                      gradient: LinearGradient(colors: [
                        //  Colors.redAccent,
                        Colors.orange,
                        Colors.yellowAccent
                      ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                    padding: EdgeInsets.symmetric(vertical: 02, horizontal: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Icon(Icons.search_sharp),
                          onTap: () {
                            if ((searchController.text).replaceAll(" ", "") ==
                                "") {
                              Text('Please Enter A Valid Search');
                            } else {
                              Navigator.pushNamed(
                                context,
                                "/loading",
                                arguments: {
                                  "searchText": searchController.text,
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded( // cool
                          flex: 1,
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: 'Search any Location ',
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Icon(Icons.send),
                          onTap: () {
                            if ((searchController.text).replaceAll(" ", "") ==
                                "") {
                              Text('Please Enter A Valid Search');
                            } else {
                              Navigator.pushNamed(
                                context,
                                "/loading",
                                arguments: {
                                  "searchText": searchController.text,
                                },
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
                // this is for the first box
                SingleChildScrollView(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(// cool
                      child: Container(

                        height: 80,
                        margin: EdgeInsets.symmetric(horizontal: 05),
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 14),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              'http://openweathermap.org/img/wn/$icon@2x.png',
                            ),
                            SizedBox(
                              width: 45,
                            ),
                            Expanded(
                              child: Column(
                                
                                children: [
                                  Expanded(
                                    child: Text(
                                      '$decrip',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '$city_name1',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 26),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),

                // this is for the next box
                Container(
                  height: 240,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        WeatherIcons.thermometer,
                        size: 40,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$temp°',
                            style: TextStyle(
                                fontSize: 65, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'C',
                            style: TextStyle(fontSize: 65),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        height: 210,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Expanded(flex: 3,
                              child: Row(
                              //  mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    WeatherIcons.humidity,
                                    color: Colors.deepOrange,
                                    size: 22,
                                  ),
                                  SizedBox(

                                  ),
                                  Text(
                                    'HUMIDITY ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              '$hum %',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 35),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 210,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  WeatherIcons.wind_beaufort_1,
                                  color: Colors.deepOrange,
                                  size: 28,
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  'AIR SPEED ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '$air_speed km/hr',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Text('Made BY ROHAN SHAHI '),
                        Text('Data is Provided by WeatherData.ORG')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
