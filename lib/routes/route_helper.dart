import 'package:flutter_applications/screens/food_%20carousel.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../screens/bottom_bar.dart';
import '../screens/food/food_details.dart';
import '../screens/food/recommended_food_details.dart';
import '../screens/home_screen.dart';

class RouterHelper{
  static const String initial="/";
  static const String popularfood="/popular-food";
  static const String recommendedfood="/recommended-food";

  //to add parameter we use these method
  static String getInitial()=> '$initial';
  static String getPopularFood(int pageId)=> '$popularfood?pageId=$pageId';
  static String getRecommededFood(int pageId)=> '$recommendedfood?pageId=$pageId';

  static List<GetPage> routes=[
      GetPage(name: initial, page: ()=>BottomBar()),
      GetPage(name: popularfood, page: (){
        var pageId = Get.parameters['pageId'];
        return FoodDetail(pageId : int.parse(pageId!));
      },

      transition: Transition.fadeIn),
        GetPage(name: recommendedfood, page: (){
         var pageId = Get.parameters['pageId'];
        return RecommenedFoodDetail(pageId : int.parse(pageId!));
      },
      transition: Transition.fadeIn),
  ];
}