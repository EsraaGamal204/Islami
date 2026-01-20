import 'package:flutter/material.dart';
import 'package:islami_app/Core/resources/AppConstants.dart';
import 'package:islami_app/Core/resources/AssetsManager.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';
import 'package:islami_app/model/OnboardingModel.dart';

class OnboardingItem extends StatelessWidget {

Onboardingmodel model;
OnboardingItem({required this.model});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.asset(model.image),
        SizedBox(height: height*0.02,),
        if(model.title.isNotEmpty)
        Text(model.title,style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: ColorsManager.PrimaryColor,
            fontFamily: "Janna LT",
        ),),
        SizedBox(height: height*0.05,),
        Text(model.desc,textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ColorsManager.PrimaryColor,
              fontFamily: "Janna LT"
        ),),
      ],),
    );
  }
}
