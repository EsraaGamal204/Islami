import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Hadeth_details/screen/hadeth_details.dart';
import 'package:islami_app/Ui/Home/Screen/HomeScreen.dart';
import 'package:islami_app/Ui/Sura_details/Screen/Sura_Details_Screen.dart';

class IslamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName:(context)=> HomeScreen(),
        SuraDetailsScreen.routeName:(_)=>SuraDetailsScreen(),
        HadethDetails.routeName:(_)=> HadethDetails(),
      },
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }

}