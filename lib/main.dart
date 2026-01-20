import 'package:flutter/material.dart';
import 'package:islami_app/Core/remote/local/PrefsManager.dart';
import 'package:islami_app/Islami_App.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Prefsmanager.init();
  runApp(IslamiApp() );
}

