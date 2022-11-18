

import 'package:flutter/material.dart';
import 'package:clilund/activities/home.dart';
import 'package:clilund/activities/loading.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/":(context)=>const Loading(),
      "/home":(context)=>const Home(),
      "/loading":(context)=>const Loading()

    },
  ),
  );
}


