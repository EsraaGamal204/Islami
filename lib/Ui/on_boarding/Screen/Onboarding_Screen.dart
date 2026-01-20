import 'package:flutter/material.dart';
import 'package:islami_app/Core/remote/local/PrefsManager.dart';
import 'package:islami_app/Core/resources/AppConstants.dart';
import 'package:islami_app/Core/resources/AssetsManager.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';
import 'package:islami_app/Core/resources/StringManager.dart';
import 'package:islami_app/Ui/Home/Screen/HomeScreen.dart';
import 'package:islami_app/Ui/on_boarding/Widget/Onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class OnboardingScreen extends StatefulWidget {
  static const String routeName ="onboarding";
  @override

  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller =PageController();
  int pageindex=0;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsManager.SecondaryColor,
     body: Padding(
       padding:  EdgeInsets.only(
           bottom: 20),
       child: Column(
         children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(Assetsmanager.islamiheader,
                height: height*0.16,fit:BoxFit.fitHeight),),
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    pageindex = index;
                  });
                },
                controller: controller,
                itemCount:Appconstants.OnboardingList.length ,
                itemBuilder: (context, index) {
                return OnboardingItem(
                  model:Appconstants.OnboardingList[index],);
              },),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
                 Visibility(
                   visible: pageindex != 0,
                   maintainSize: true,
                   maintainAnimation: true,
                   maintainState: true,
                   child: TextButton(onPressed: () {
                     controller.previousPage(duration: Duration(seconds: 1),
                         curve:Curves.easeInOut);
                   }, child: Text(
                                StringManager.Back
                             ,style: TextStyle(fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                color: ColorsManager.PrimaryColor,
                                                fontFamily: "Janna LT"),)),
                 ),
               SmoothPageIndicator(
                   controller: controller,
                   count:  Appconstants.OnboardingList.length,
                   effect:  ExpandingDotsEffect(
                     dotWidth: 9,
                     dotHeight: 7,
                     dotColor: ColorsManager.dotsColor,
                     activeDotColor: ColorsManager.PrimaryColor,
                     expansionFactor: 3,
                   ),
                   onDotClicked: (index){
                     controller.animateToPage(index,
                         duration: Duration(seconds: 1),
                         curve: Curves.easeInOut);
                   }
               ),
               TextButton(onPressed: () {
                 if(pageindex == Appconstants.OnboardingList.length-1)
                   {
                     Prefsmanager.saveOnboarding();
                     Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                   }
                 else{
                   controller.nextPage(duration: Duration(
                     seconds: 1
                   ), curve: Curves.easeInOut);
                 }
               }, child: Text(pageindex==Appconstants.OnboardingList.length-1
               ? StringManager.Finish
               :StringManager.Next,style: TextStyle(fontWeight: FontWeight.w700,
                   fontSize: 16,
                   color: ColorsManager.PrimaryColor,
                   fontFamily: "Janna LT"),))
             ],
           )
         ],
       ),
     ),

    );
  }
}
