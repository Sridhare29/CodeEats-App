import 'package:flutter_applications/data/api/api_client.dart';
import 'package:flutter_applications/data/controllers/product_controller.dart';
import 'package:flutter_applications/data/repository/product_repo.dart';
import 'package:get/get.dart';

Future<void> init()async{
  //apiclient
  Get.lazyPut(()=>ApiClient(appBaseUrl: "http://mvs.bslmeiyu.com"));
  //repos
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  //controller
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
}