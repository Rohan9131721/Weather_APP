// ignore_for_file: annotate_overrides, override_on_non_overriding_member, prefer_const_constructors, use_build_context_synchronously, prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:clilund/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String locate = "Amsterdam";
  late String temp;
  late String hum;
  late String air_speed;
  late String descrip;
  late String main;
  late String icon;
  @override
  void StartApp() async {
    if(mounted)setState(() {

    });
    worker instance = worker(locate);
    await instance.GetData();
    locate = instance.location;
    temp = instance.temperature;
    hum = instance.humidity.toString();
    descrip = instance.description;
    air_speed = instance.air_speed.toString();
    icon=instance.icon;
// with the help of this navigator we are sending values to the home page as our context is home page.
    if(mounted)setState(() {
      Navigator.pushReplacementNamed(
        context,
        '/home',
        arguments: {
          'temp_value': temp,
          'locate_value': locate,
          'humid_value': hum,
          'descrip_value': descrip,
          'air_speed_value': air_speed,
          'icon_value':icon
        },

      );
    });

    Future.delayed(Duration(seconds: 60),);// these values will now reach the home page and we need to catch it from the home page.
  }

  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    Map<dynamic,dynamic> search = (ModalRoute.of(context)!.settings.arguments??{}) as Map<dynamic,dynamic>;

    if(search.isNotEmpty)
    {
      locate = search['searchText'];
    }
    if(mounted)setState(() {

    });
    StartApp();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: ResizeImage(AssetImage('assets/images/location_background.png'),width: 1080,height: 2214),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //SpinKitDancingSquare(color: Colors.tealAccent,size: 20,),
          SpinKitChasingDots(color: Colors.amber,size: 60,),
            SizedBox(height: 70,),
            Expanded(
              child: Center(
                child: Text(
                  ' WEATHER APP ',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Water Brush',
                      fontSize: 90),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Expanded(
              child: Center(
                  child: Text(
                'WELCOME !! ',
                style: TextStyle(fontFamily: 'Water Brush',fontSize: 60,color: Colors.white,letterSpacing: 4),
              ),
              ),
            ),
            SizedBox(height: 5,),
            SpinKitWave(color: Colors.yellowAccent,size: 80,),
        SizedBox(height: 100,),
            Expanded(child: Text('Designed By:- ROHAN SHAHI ',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 20,color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
