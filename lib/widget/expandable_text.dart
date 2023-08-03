import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_applications/colors/colors.dart';
import 'package:flutter_applications/colors/dimensions.dart';
import 'package:flutter_applications/widget/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  @override
  void initState() {
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }
    else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  double textHeight = Dimensions.screenHeight/4.66;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(size: Dimensions.font16,text: firstHalf,color: AppColors.paraColor,):Column(
        children: [
           SmallText(text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf),size: Dimensions.font16,color: AppColors.paraColor,height: 1.5,),
          InkWell(
            onTap: (){
                setState(() {
                  hiddenText=!hiddenText;
                });
            },
            child: Row(children: [
              SmallText(text: "Show more", color: AppColors.mainColor,),
              Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.mainColor,)
            ]),
          )
        ],
        
      ),
    );
  }
}