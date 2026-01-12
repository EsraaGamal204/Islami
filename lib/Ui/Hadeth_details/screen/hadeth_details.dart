import 'package:flutter/material.dart';
import 'package:islami_app/model/HadethModel.dart';

import '../../../Core/resources/AssetsManager.dart';
import '../../../Core/resources/ColorManager.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName ="hadeth";
  @override
  Widget build(BuildContext context) {
    HadethModel hadethModel = ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor:ColorsManager.SecondaryColor ,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
            color: ColorsManager.PrimaryColor
        ),
        title:Text("Hadeth ${hadethModel.number}"),

        titleTextStyle: TextStyle(fontSize: 20,

          fontWeight: FontWeight.w700,
          color: ColorsManager.PrimaryColor,
        ),
        centerTitle: true,
      ),
      body:Column(
        children: [
          Expanded(
            child: Padding(
              padding:  EdgeInsets.only(
                  right: 10,
                  left: 10,
                  top: 10
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(Assetsmanager.Quranleft),
                      Text(hadethModel.title,style:  TextStyle(fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.PrimaryColor,
                      ),),
                      Image.asset(Assetsmanager.Quranright),
                    ],
                  ),
                  Expanded(
                    child:
                        SingleChildScrollView(
                      child: Text(hadethModel.content,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height:2.5 ,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: ColorsManager.PrimaryColor,
                          )),
                    ),
                  ),
                ],),),),
          Image.asset(Assetsmanager.Quranbottom),
        ],
      ),

    );
  }
}
