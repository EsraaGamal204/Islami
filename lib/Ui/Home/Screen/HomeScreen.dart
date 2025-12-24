import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/Core/resources/AssetsManager.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';
import 'package:islami_app/Core/resources/StringManager.dart';
import 'package:islami_app/Ui/Home/tabs/Hadeth_tab/HadethTab.dart';
import 'package:islami_app/Ui/Home/tabs/Quran_tab/QuranTab.dart';
import 'package:islami_app/Ui/Home/tabs/Radio_tab/RadioTab.dart';
import 'package:islami_app/Ui/Home/tabs/Sebha_tab/SebhaTab.dart';
import 'package:islami_app/Ui/Home/tabs/Time_tab/TimeTab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName ="home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectedIndex = 0 ;
List<Widget>tabs=[
  Qurantab(),
  Hadethtab(),
  Sebhatab(),
  Radiotab(),
  Timetab(),
];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: ColorsManager.onPrimaryColor,
    bottomNavigationBar:
    NavigationBar(
      onDestinationSelected: (value) {
        setState(() {
          SelectedIndex = value;
        });
      } ,
      selectedIndex: SelectedIndex,
        backgroundColor: ColorsManager.PrimaryColor,
        indicatorColor: ColorsManager.SecondaryColor.withValues(
          alpha: 0.6
        ),
        labelBehavior:NavigationDestinationLabelBehavior.onlyShowSelected,
        labelTextStyle:WidgetStateTextStyle.resolveWith((states){
          return TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: ColorsManager.onPrimaryColor
          );
        },) ,
        destinations: [
          NavigationDestination(
            icon:SvgPicture.asset(Assetsmanager.QuranTab),
            label: StringManager.QuranTab,
          selectedIcon: SvgPicture.asset(Assetsmanager.QuranSelectedTab),
        ),
          NavigationDestination(
            icon:SvgPicture.asset(Assetsmanager.hadethTab),
            label: StringManager.HadethTab,
            selectedIcon: SvgPicture.asset(Assetsmanager.hadethSelectedTab),
          ),
          NavigationDestination(
            icon:SvgPicture.asset(Assetsmanager.SebhaTab),
            label: StringManager.SebhaTab,
            selectedIcon: SvgPicture.asset(Assetsmanager.SebhaSelectedTab),
          ),
          NavigationDestination(
            icon:SvgPicture.asset(Assetsmanager.radioTab),
            label: StringManager.RadioTab,
            selectedIcon: SvgPicture.asset(Assetsmanager.radioSelectedTab),
          ),
          NavigationDestination(
            icon:SvgPicture.asset(Assetsmanager.TimeTab),
            label: StringManager.TimeTab,
            selectedIcon: SvgPicture.asset(Assetsmanager.TimeSelectedTab),
          ),

    ]),
    body:tabs[SelectedIndex],

  );
  }
}