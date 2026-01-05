import 'package:flutter/material.dart';
import 'package:islami_app/Core/resources/AssetsManager.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';

class MostRecentlyItem extends StatelessWidget {
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
              Text("Al-Anbiya", style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorsManager.SecondaryColor,
              ),),
              Text("الأنبياء", style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorsManager.SecondaryColor,
              ),),
              Text("112 Verses", style: TextStyle(
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
