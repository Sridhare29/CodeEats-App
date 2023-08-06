import 'package:flutter/material.dart';
import 'package:flutter_applications/colors/app_constants.dart';
import 'package:flutter_applications/colors/dimensions.dart';
import 'package:flutter_applications/models/products.dart';
import 'package:flutter_applications/routes/route_helper.dart';
import 'package:flutter_applications/widget/app_column.dart';
import 'package:flutter_applications/widget/app_icon.dart';
import 'package:get/get.dart';

import '../../colors/colors.dart';
import '../../data/controllers/product_controller.dart';
import '../../widget/big_text.dart';
import '../../widget/expandable_text.dart';
import '../../widget/small_text.dart';
import '../food_ carousel.dart';
import '../home_screen.dart';
import '../icon_and_text_widget.dart';

class FoodDetail extends StatelessWidget {
  int pageId;
  FoodDetail({super.key,required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<ProductController>().ProductList[pageId];
    // print("page id :"+ pageId.toString());
    // print("page id :"+ product.name.toString());
    Get.find<ProductController>().initProduct();
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
                  image: NetworkImage(
                    AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                  ),
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
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouterHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios)),
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
                  AppColumn(text: product.name!),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text:product.location!),
                  SizedBox(height: Dimensions.height20,),
                  Expanded(child:  SingleChildScrollView(child:  ExpandableTextWidget(text: product.description!))),

                ],
              )
            ),
          ),
         //expand text widget

        ],
      ),
      bottomNavigationBar: GetBuilder<ProductController>(builder: (popularProductQuantity){
        return Container(
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
                  GestureDetector(
                      onTap: (){
                      popularProductQuantity.setQuantity(false);
                    },
                  child: Icon(Icons.remove, color: AppColors.signColor,)),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: popularProductQuantity.quantiy.toString()),
                  SizedBox(width: Dimensions.width10/2,),
                  GestureDetector(
                    onTap: (){
                      popularProductQuantity.setQuantity(true);
                    },
                    child: Icon(Icons.add, color: AppColors.signColor,))
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
                  BigText(text: "\$ ${product.price!} | Add to cart",color: Colors.white,)
                ],
              ),
            )
          ],
        ),
      );
      },)
    );
  }
}
