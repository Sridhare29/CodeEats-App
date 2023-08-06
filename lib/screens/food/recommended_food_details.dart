import 'package:flutter/material.dart';
import 'package:flutter_applications/colors/app_constants.dart';
import 'package:flutter_applications/colors/colors.dart';
import 'package:flutter_applications/colors/dimensions.dart';
import 'package:flutter_applications/data/controllers/recommended_product_controller.dart';
import 'package:flutter_applications/routes/route_helper.dart';
import 'package:flutter_applications/widget/app_icon.dart';
import 'package:flutter_applications/widget/big_text.dart';
import 'package:flutter_applications/widget/expandable_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RecommenedFoodDetail extends StatelessWidget {
  final int pageId ;
  RecommenedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().RecommendedProductList[pageId];
    return  Scaffold(
      backgroundColor: Colors.white,
       body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading : false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(RouterHelper.getInitial());
                  },
                  child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(preferredSize: Size.fromHeight(20),
            child: Container(
              child: Center(child: BigText(text: product.name!,size: Dimensions.font16,),),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: 10,bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20)
                )
              ),
            )
            ),
            pinned: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
               background: Image.network(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
               width: double.maxFinite,
               fit: BoxFit.cover ,
               ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: product.description!),  
                margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.radius20),
                ),
              ],
            )
          )
        ],
       ),
       bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,right: Dimensions.radius20*2.5,top: Dimensions.height10,bottom: Dimensions.height10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              AppIcon(icon: Icons.remove,backgroundColor: AppColors.mainColor,iconSize: Dimensions.iconSize24,iconColor: Colors.white,),
              BigText(text: "\$ ${product.price}"+" X "+" 0",color: AppColors.mainblackColor,size: Dimensions.font26,),
              AppIcon(icon: Icons.add,backgroundColor: AppColors.mainColor,iconSize: Dimensions.iconSize24,iconColor: Colors.white,),

            ],),
          ),
          Container(
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
              child: Icon(
                Icons.favorite,
                color: AppColors.mainColor,
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
                  BigText(text: "\$ ${product.price} Add to cart",color: Colors.white,)
                ],
              ),
            )
          ],
        ),
      ),
        ],
       ),
    );
  }
}