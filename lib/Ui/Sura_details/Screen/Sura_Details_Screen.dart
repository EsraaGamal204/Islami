import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Core/resources/AssetsManager.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';
import 'package:islami_app/Model/SuraModel.dart';
class SuraDetailsScreen extends StatefulWidget
{
  static const String routeName ="suradetails";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Suramodel suraModel = ModalRoute.of(context)!.settings.arguments as Suramodel;
    if(suraText.isEmpty){
    readFile(suraModel.suraNumber);}
    return Scaffold(
      backgroundColor:ColorsManager.SecondaryColor ,
      appBar: AppBar(
        scrolledUnderElevation: 0,
       backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: ColorsManager.PrimaryColor
        ),
        title:Text(suraModel.suraNameEn),
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
                    Text(suraModel.suraNameAr,style:  TextStyle(fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.PrimaryColor,
                    ),),
                    Image.asset(Assetsmanager.Quranright),
                  ],
                  ),
                  Expanded(
                    child: suraText.isEmpty
                        ?Center(
                       child: CircularProgressIndicator(
                        color: ColorsManager.PrimaryColor,
                       ),
                     )
                    :SingleChildScrollView(
                      child: Text(suraText,
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

  String suraText="";
  readFile(int suraNumber)async
  {
  String sure= await rootBundle.loadString("assets/Suras/$suraNumber.txt");
  List<String>suraLines= sure.split("\n");
  for(int i =0;i<suraLines.length;i++)
    {
      suraText+=suraLines[i];
      suraText+="(${i+1})";
    }
  setState(() {

  });


  }
}
