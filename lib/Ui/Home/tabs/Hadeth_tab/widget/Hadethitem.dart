import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/Core/resources/AssetsManager.dart';
import 'package:islami_app/Core/resources/ColorManager.dart';
import 'package:islami_app/Ui/Hadeth_details/screen/hadeth_details.dart';
import 'package:islami_app/model/HadethModel.dart';

class Hadethitem extends StatefulWidget {
  int index;
  int selectedIndex;

  Hadethitem({required this.index, required this.selectedIndex});

  @override
  State<Hadethitem> createState() => _HadethitemState();
}

class _HadethitemState extends State<Hadethitem> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFile();
  }
  @override
  Widget build(BuildContext context) {

    return
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, HadethDetails.routeName,
              arguments:hadethModel );
        },
        child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: widget.selectedIndex == widget.index
                    ? 0
                    : 20
            ),
            decoration: BoxDecoration(
              color: ColorsManager.PrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 12,
                      right: 12,
                      left: 12,
                    ),
                    child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(Assetsmanager.leftcornerhadeth),
                                  Image.asset(Assetsmanager.rightcornerhadeth),
                                ],
                              ),
                              Expanded(
                                child: Text(hadethModel?.title??"",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: ColorsManager.SecondaryColor
                                  ),),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Image.asset(Assetsmanager.HadithCardBackGround),
                                Text(hadethModel?.content??""
                                  ,maxLines:10
                                  ,overflow: TextOverflow.ellipsis
                                  ,textDirection: TextDirection.rtl
                                  , textAlign: TextAlign.center
                                  , style: TextStyle(
                                    fontFamily: "Janna LT",
                                    fontSize: 16,
                                    height: 1.6,
                                    fontWeight: FontWeight.w700,
                                    color: ColorsManager.SecondaryColor,
                                  ),),
                              ],),
                          ),
        
                        ]),
                  ),
                ),
                Image.asset(Assetsmanager.Mosquehadeth, width: double.infinity,
                  fit: BoxFit.fill,)
              ],
            )
        
        ),
      );
  }
  HadethModel? hadethModel;

  loadFile() async{
   String hadeth= await rootBundle.loadString("assets/Hadeeth/h${widget.index+1}.txt");
   List<String>hadethLines =hadeth.split("\n");
     String hadethTitle= hadethLines[0].trim();
     hadethLines.removeAt(0);
     String hadethContent = hadethLines.join(" ").trim();
     hadethModel= HadethModel(
         number: widget.index+1,
         title:hadethTitle,
         content: hadethContent);
     setState(() {

     });


  }
}
