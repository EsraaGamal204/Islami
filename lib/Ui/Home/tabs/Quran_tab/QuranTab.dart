import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/Core/resources/AssetsManager.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';
import 'package:islami_app/Core/resources/StringManager.dart';
import 'package:islami_app/Ui/Home/tabs/Quran_tab/Widget/Most_Recently_List.dart';
import 'package:islami_app/Ui/Home/tabs/Quran_tab/Widget/Sura_List.dart';

class Qurantab extends StatelessWidget {
  const Qurantab({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
          image:AssetImage(Assetsmanager.BackgroundQuran)
        )),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(Assetsmanager.islamiheader,
            height: 0.16*height,fit: BoxFit.fitHeight,),
        ),
          SizedBox(height:height*0.02 ,),
          TextField(
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: ColorsManager.onPrimaryColor
            ),
            decoration: InputDecoration(
              hintText: StringManager.SuraName,
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: ColorsManager.onPrimaryColor
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(Assetsmanager.QuranTab,
                    colorFilter:ColorFilter.mode(ColorsManager.PrimaryColor,
                        BlendMode.srcIn) ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorsManager.PrimaryColor,
                ),
              ),
              focusedBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorsManager.PrimaryColor,
                ),
            ),

          ),),
          SizedBox(height:height*0.02 ,),
          Text(StringManager.MostRecently,style:TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: ColorsManager.onPrimaryColor
          ),),
            SizedBox(height: height*0.01,),
            Container(
              height: height*0.15,
                child: MostRecentlyList()),
            SizedBox(height: height*0.01,),
            Text(StringManager.SurasList,style:TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: ColorsManager.onPrimaryColor
            ),),
            SizedBox(height: height*0.01,),
            Expanded(child: SuraList()),



        ],

        ),
      ),
    );
  }
}
