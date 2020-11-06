import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx_and_frach_data/view/login.dart';
import 'package:login_getx_and_frach_data/view/register.dart';

import 'view/home_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData.dark(),
//      home: FoodHomePage(),
      home: LoginPage(),
    );
  }
}
