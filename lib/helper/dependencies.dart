import 'package:flutter_applications/colors/app_constants.dart';
import 'package:flutter_applications/data/api/api_client.dart';
import 'package:flutter_applications/data/controllers/product_controller.dart';
import 'package:flutter_applications/data/repository/product_repo.dart';
import 'package:get/get.dart';

import '../data/controllers/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init()async{
  //apiclient
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));
  //repos
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => RecommendedProductController(recommendedproductRepo: Get.find()));
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
}