import 'package:flutter/material.dart';
import 'package:flutter_applications/colors/colors.dart';
import 'package:flutter_applications/colors/dimensions.dart';
import 'package:flutter_applications/routes/route_helper.dart';
import 'package:flutter_applications/widget/app_icon.dart';
import 'package:flutter_applications/widget/big_text.dart';
import 'package:flutter_applications/widget/expandable_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RecommenedFoodDetail extends StatelessWidget {
  const RecommenedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Center(child: BigText(text: "Strawberry Pancakes",size: Dimensions.font16,),),
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
               background: Image.asset("images/jap.jpg",
               width: double.maxFinite,
               fit: BoxFit.cover ,
               ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: "A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked.A pancake is a thin, flat cake that's made by pouring batter into a pan—hence its name—and then flipping it so that both sides are cooked."),  
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
              BigText(text: "\$12.88 "+" X "+" 0",color: AppColors.mainblackColor,size: Dimensions.font26,),
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
                  BigText(text: "\$ 0.08  Add to cart",color: Colors.white,)
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