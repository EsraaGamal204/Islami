import 'package:flutter/material.dart';
import 'package:islami_app/model/HadethModel.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName ="hadeth";
  @override
  Widget build(BuildContext context) {
    HadethModel hadethModel = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(

    );
  }
}
