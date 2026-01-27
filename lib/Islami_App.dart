import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Hadeth_details/screen/hadeth_details.dart';
import 'package:islami_app/Ui/Home/Screen/HomeScreen.dart';
import 'package:islami_app/Ui/Sura_details/Screen/Sura_Details_Screen.dart';
import 'package:islami_app/Ui/on_boarding/Screen/Onboarding_Screen.dart';

class IslamiApp extends StatelessWidget {
  final bool seenOnboarding;
  IslamiApp({required this.seenOnboarding});
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: {
        OnboardingScreen.routeName:(_)=>OnboardingScreen(),
        HomeScreen.routeName:(context)=> HomeScreen(),
        SuraDetailsScreen.routeName:(_)=>SuraDetailsScreen(),
        HadethDetails.routeName:(_)=> HadethDetails(),
      },
      initialRoute:  seenOnboarding
        ? HomeScreen.routeName
        : OnboardingScreen.routeName,

      debugShowCheckedModeBanner: false,
    );
  }

}