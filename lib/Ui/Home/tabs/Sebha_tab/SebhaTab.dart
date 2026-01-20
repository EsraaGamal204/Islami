import 'package:flutter/material.dart';

import 'package:islami_app/Core/resources/AppConstants.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';
import 'package:islami_app/Core/resources/StringManager.dart';

import '../../../../Core/resources/AssetsManager.dart';

class Sebhatab extends StatefulWidget {
  const Sebhatab({super.key});

  @override
  State<Sebhatab> createState() => _SebhatabState();
}

class _SebhatabState extends State<Sebhatab> {
  int counter =0;
  int zekrIndex = 0;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(

      decoration: BoxDecoration(
        color: ColorsManager.SecondaryColor,
        image: DecorationImage(
            image:AssetImage(Assetsmanager.Backgroundsebha)),
      ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(Assetsmanager.islamiheader,
                    height: height*0.16,fit:BoxFit.fitHeight),
              ),
              SizedBox(height: height*0.03,),
              Text(StringManager.Titlesebha,style: TextStyle(fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: ColorsManager.onPrimaryColor,
                  fontFamily: "Janna LT"),),
              SizedBox(height: height*0.03,),

              Expanded(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 26),
                  child:
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 8 ,
                          child: Image.asset(
                            Assetsmanager.sebhabody2,
                            height: height * 0.09,
                          ),
                        ),
                        GestureDetector(
                          onTap: onSebhaTap,
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 0.01),
                            child:AnimatedRotation(
                              turns: angle,
                              duration: const Duration(milliseconds: 300),
                              child: Image.asset(
                                Assetsmanager.SebhaBody1,
                                height: height * 0.55,
                              ),
                            )

                          ),
                        ),Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(Appconstants.zekrList[zekrIndex],
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.onPrimaryColor,
                        fontFamily: "Janna LT",),),
                              SizedBox(height: height*0.03,),
                              Text(counter.toString(),
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w700,
                                  color: ColorsManager.onPrimaryColor,
                                  fontFamily: "Janna LT",),),


                            ],),
                  )
                      ]),
                ),
              )
            ],
          ),
        ),);
  }
  void onSebhaTap() {
    setState(() {
      counter++;
      angle += 1 / 12;
      if (counter == 33) {
        counter = 0;
        zekrIndex = (zekrIndex + 1) % Appconstants.zekrList.length;
      }
    });
  }}
