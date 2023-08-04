import 'package:flutter_applications/screens/food_%20carousel.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/food/food_details.dart';
import '../screens/home_screen.dart';

class RouterHelper{
  static const String initial="/";
  static const String popularfood="/popular-food";

  static List<GetPage> routes=[
      GetPage(name: "/", page: ()=>HomeScreen()),
      GetPage(name: popularfood, page: ()=>FoodDetail()),
  ];
}