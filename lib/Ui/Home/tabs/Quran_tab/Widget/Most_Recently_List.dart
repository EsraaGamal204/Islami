import 'package:flutter/material.dart';
import 'package:islami_app/Ui/Home/tabs/Quran_tab/Widget/Most_Recently_Item.dart';

class MostRecentlyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return ListView.separated(
  scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) => MostRecentlyItem(),
    separatorBuilder:(context, index) => SizedBox(width:10 ,),
    itemCount:10);
  }
}
