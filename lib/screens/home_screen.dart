import 'package:flutter/material.dart';
import 'package:flutter_applications/colors/colors.dart';
import 'package:flutter_applications/colors/dimensions.dart';
import 'package:flutter_applications/widget/big_text.dart';
import 'package:flutter_applications/widget/small_text.dart';

import 'food_ carousel.dart';
  
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
      //print(MediaQuery.of(context).size.width.toString());

    return Scaffold(
      body: Column(
        children: [
      Container(
        margin:  EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15),
        padding:  EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
        child: Row( 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              BigText(text: "India",color: AppColors.mainColor,),
              Row(children: [
                  SmallText(text: "Chennai",color: Colors.black54,),
                  const Icon(Icons.arrow_drop_down_rounded)
                ],
                ),
               ],
            ),
          Center(
            child: Container(
            width: Dimensions.height45,
            height: Dimensions.height45,
            child:  Icon(Icons.search,color: Colors.white,size: Dimensions.iconSize24,),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius15),
            color: AppColors.mainColor,
                  ),
                  ),
          ),
          ],
        ),
      
      ),
     Expanded(child: SingleChildScrollView(child: FoodItem(),)) ,
        ],
      )
    );
  }
}