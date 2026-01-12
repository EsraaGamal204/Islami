import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Hadeth_details/screen/hadeth_details.dart';
import 'package:islami_app/Ui/Home/Screen/HomeScreen.dart';

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName:(context)=> HomeScreen(),
        HadethDetails.routeName:(_)=> HadethDetails(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }

}