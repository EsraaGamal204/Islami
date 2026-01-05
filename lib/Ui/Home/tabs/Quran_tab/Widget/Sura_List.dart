import 'package:flutter/material.dart';
import 'package:islami_app/Core/resources/AppConstants.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';
import 'package:islami_app/Ui/Home/tabs/Quran_tab/Widget/Sura_Item.dart';

class SuraList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (context, index) => SuraItem(Appconstants.surasList[index]),
        separatorBuilder:(context, index) => Divider(
          color: ColorsManager.onPrimaryColor,
          endIndent:width*0.1,
          indent: width*0.1 ,
        ) ,
        itemCount: Appconstants.surasList.length);
  }
}
