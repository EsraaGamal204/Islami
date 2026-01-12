import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_app/Core/resources/AppConstants.dart';
import 'package:islami_app/Model/SuraModel.dart';

import '../../../../../Core/resources/AssetsManager.dart';
import '../../../../../Core/resources/ColorManager.dart';
import '../../../../Sura_details/Screen/Sura_Details_Screen.dart';

class SuraItem extends StatelessWidget {
  Suramodel suramodel ;
  SuraItem( this.suramodel);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments:suramodel);
      },
      child: Row(
        children: [
          Stack(
            alignment:  Alignment.center,
            children: [
              SvgPicture.asset(Assetsmanager.SuraNumber),
              Text(suramodel.suraNumber.toString(),style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: ColorsManager.onPrimaryColor,
              ),)
            ],),
          SizedBox(width: width*0.05,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(suramodel.suraNameEn,style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorsManager.onPrimaryColor,
                ),),
                Text("${suramodel.suraVerses} Verses",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                  color: ColorsManager.onPrimaryColor,
                ),),
                  ],),
          ),

          Text(suramodel.suraNameAr,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            color: ColorsManager.onPrimaryColor,
          ),)

        ]),
    );
  }
}
