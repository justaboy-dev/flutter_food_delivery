import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_food_delivery_v1/screen/map_pick/mappick.dart';
import 'package:flutter_food_delivery_v1/screen/rate/rate.dart';
import 'package:flutter_food_delivery_v1/screen/signup/fillbio.dart';
import 'package:flutter_food_delivery_v1/screen/signup/location.dart';
import 'package:flutter_food_delivery_v1/screen/signup/uploadavatar.dart';

import 'screen/signin/signin.dart';
import 'screen/signup/signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.black,
          fontFamily: "RobotoSlab",
        ),
        darkTheme: ThemeData(scaffoldBackgroundColor: Colors.black26),
        home: const MapPick());
  }
}
