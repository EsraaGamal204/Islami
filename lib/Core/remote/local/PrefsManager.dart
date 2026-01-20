import 'package:islami_app/Core/resources/AppConstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/SuraModel.dart';

class Prefsmanager {
  static late final SharedPreferences prefs;
  static init()async{
prefs = await SharedPreferences.getInstance();
  }
  static saveMostRecently(List<Suramodel>mostRecently){
    prefs.setStringList("most_recently", mostRecently.map((sura)=>sura.suraNameEn, ).toList());

  }
  static List<Suramodel>getMostRecently(){
  List<String>suraNames =  prefs.getStringList("most_recently")??[];
  List<Suramodel>sures=[];
  for(int i =0;i<suraNames.length;i++){
    for(int j =0;j<Appconstants.surasList.length;j++){
      if(suraNames[i]==Appconstants.surasList[j].suraNameEn){
        sures.add(Appconstants.surasList[j]);
        break;
      }
    }
  }
  return sures;
  }
  static void saveOnboarding()
  {
    prefs.setBool("onboardingSeen", true);
  }
  static bool isOnboardingSeen()
  {
    return prefs.getBool("onboardingSeen")??false;
  }
}