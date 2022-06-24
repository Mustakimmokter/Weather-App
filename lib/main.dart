import 'package:flutter/material.dart';
import 'package:weathe_app/screens/city_screen.dart';
import 'package:weathe_app/screens/home_page.dart';
import 'package:weathe_app/screens/location_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: HomePage.pageRoute,
      routes: {
        HomePage.pageRoute: (context) => HomePage(),
        LocationScreen.pageRoute: (context) => LocationScreen(),
        CityScreen.pageRoute: (context) => CityScreen()
      },
    );
  }
}
