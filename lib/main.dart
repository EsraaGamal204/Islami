import 'package:flutter/material.dart';
import 'package:islami_app/Core/remote/local/PrefsManager.dart';
import 'package:islami_app/Islami_App.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  final prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('onboardingSeen') ?? false;

  runApp(IslamiApp(seenOnboarding: seenOnboarding));
}

