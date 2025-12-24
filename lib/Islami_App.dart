import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Home/Screen/HomeScreen.dart';

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName:(context)=> HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }

}