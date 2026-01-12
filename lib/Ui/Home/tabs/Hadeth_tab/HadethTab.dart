import 'package:flutter/material.dart';
import 'package:islami_app/Core/resources/AssetsManager.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';
import 'package:islami_app/Ui/Home/tabs/Hadeth_tab/widget/Hadethitem.dart';

class Hadethtab extends StatefulWidget {
  @override
  State<Hadethtab> createState() => _HadethtabState();
}

class _HadethtabState extends State<Hadethtab> {
 PageController controller=PageController(
   viewportFraction: 0.8,
 );

 int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(width: width*1,
      decoration: BoxDecoration(
        color: ColorsManager.SecondaryColor,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
           alignment:  Alignment.topCenter,
            image: AssetImage(Assetsmanager.Backgroundhadeth)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 20
          ),
          child: Column(
            children: [
              Image.asset(Assetsmanager.islamiheader,
              width: width*0.8,
              fit: BoxFit.fitWidth,),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      selectedIndex=index;
                    });
                  },
                  controller: controller,
                    itemCount:50,
                    itemBuilder: (context, index) =>Hadethitem(index: index,
                    selectedIndex: selectedIndex,)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
