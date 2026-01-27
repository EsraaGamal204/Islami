import 'package:flutter/material.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';
import 'package:islami_app/Model/SuraModel.dart';
import 'package:islami_app/Ui/Home/tabs/Quran_tab/Widget/Most_Recently_Item.dart';

class MostRecentlyList extends StatelessWidget {
  List<Suramodel>mostRecently;
  MostRecentlyList(this.mostRecently);
  @override
  Widget build(BuildContext context) {
return mostRecently.isEmpty?
    Center(
      child: Text("No history found",style: TextStyle(
        color: ColorsManager.PrimaryColor,
        fontSize:24,
          fontWeight: FontWeight.w700
      ),),
    )
    :ListView.separated(
  scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => MostRecentlyItem(mostRecently[index]),
    separatorBuilder:(context, index) => SizedBox(width:10 ,),
    itemCount:mostRecently.length);
  }
}
