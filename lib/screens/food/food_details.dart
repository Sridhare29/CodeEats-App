import 'package:flutter/material.dart';
import 'package:flutter_applications/colors/dimensions.dart';
import 'package:flutter_applications/widget/app_column.dart';
import 'package:flutter_applications/widget/app_icon.dart';

import '../../colors/colors.dart';
import '../../widget/big_text.dart';
import '../../widget/expandable_text.dart';
import '../../widget/small_text.dart';
import '../icon_and_text_widget.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.foodDetailImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("images/pan.jpg"),
                ),
              ),
            ),
          ),
          //icon widget
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
          ),
         //introduction of food 
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.foodDetailImgSize - 30,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                        ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(text: "Strawberry Vanilla Pancake"),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text:"Introduce"),
                  SizedBox(height: Dimensions.height20,),
                  const Expanded(child:  SingleChildScrollView(child:  ExpandableTextWidget(text: "Framer is a design and prototyping tool that allows you to create interactive and high-fidelity user interfaces. It provides a comprehensive set of features for designing, animating, and collaborating on interface designs. With Framer, you can quickly turn your ideas into interactive prototypes and test them on various devices. Its intuitive interface and powerful functionality make it a popular choice for designers and developers. Whether you're designing for web, mobile, or desktop, Framer helps streamline your design workflow and bring your concepts to life.",)))

                ],
              )
            ),
          ),
         //expand text widget

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(top: Dimensions.height30,left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height30),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: "1"),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add, color: AppColors.signColor,)
                ],
              ),
            ),
            Container(
              
              padding: EdgeInsets.only(top: Dimensions.height20,bottom: Dimensions.height20,left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,     
              ),
              child: Row(
                children: [
                  BigText(text: "\$ 0.08  Add to cart",color: Colors.white,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
