import 'package:flutter/material.dart';
import 'package:islami_app/Core/resources/AssetsManager.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';
import 'package:islami_app/Model/SuraModel.dart';

class MostRecentlyItem extends StatelessWidget {
  Suramodel suramodel;
  MostRecentlyItem(this.suramodel);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: ColorsManager.PrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(suramodel.suraNameEn, style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorsManager.SecondaryColor,
              ),),
              Text(suramodel.suraNameAr, style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorsManager.SecondaryColor,
              ),),
              Text("${suramodel.suraVerses} Verses", style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: ColorsManager.SecondaryColor,
              ),),

            ],),
          Image.asset(Assetsmanager.most_recent),
        ],),
    );
  }
}
