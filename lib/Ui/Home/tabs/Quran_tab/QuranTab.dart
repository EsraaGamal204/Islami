import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/Core/remote/local/PrefsManager.dart';
import 'package:islami_app/Core/resources/AppConstants.dart';
import 'package:islami_app/Core/resources/AssetsManager.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';
import 'package:islami_app/Core/resources/StringManager.dart';
import 'package:islami_app/Model/SuraModel.dart';
import 'package:islami_app/Ui/Home/tabs/Quran_tab/Widget/Most_Recently_List.dart';
import 'package:islami_app/Ui/Home/tabs/Quran_tab/Widget/Sura_List.dart';

class Qurantab extends StatefulWidget {
  @override
  State<Qurantab> createState() => _QurantabState();
}

class _QurantabState extends State<Qurantab> {
  String searchText="";
  List<Suramodel>mostRecently=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filteredSuras = Appconstants.surasList;
    mostRecently=Prefsmanager.getMostRecently();
  }
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
           onChanged:(value) {
            setState(() {
              searchText = value;
              suraNameSearch();
            });
           } ,
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
          if(searchText.isEmpty)...[
            Text(StringManager.MostRecently,style:TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: ColorsManager.onPrimaryColor
            ),),
            SizedBox(height: height*0.01,),
            Container(
                height: height*0.15,
                child: MostRecentlyList(mostRecently)),
            SizedBox(height: height*0.01,),
            Text(StringManager.SurasList,style:TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: ColorsManager.onPrimaryColor
            ),),
            SizedBox(height: height*0.01,),

          ],

            Expanded(child: SuraList(filteredSuras,(Suramodel sura) {
            setState(() {
              if(mostRecently.contains(sura)){
                mostRecently.remove(sura);
                mostRecently.insert(0, sura);
              }
              else{
                mostRecently.insert(0, sura);
              }
              Prefsmanager.saveMostRecently(mostRecently);
            });

            } ,)),



        ],

        ),
      ),
    );
  }
  List<Suramodel>filteredSuras=[];
  suraNameSearch(){
    if(searchText.isEmpty)
      {
        filteredSuras=Appconstants.surasList;
      }
    else
      {
        filteredSuras=[];
        for(int i =0 ;i<Appconstants.surasList.length;i++){
          if(Appconstants.surasList[i].suraNameEn.toLowerCase().contains(searchText.toLowerCase())||
              Appconstants.surasList[i].suraNameAr.toLowerCase().contains(searchText.toLowerCase())){
            filteredSuras.add(Appconstants.surasList[i]);
          }
        }

      }
  }
}
