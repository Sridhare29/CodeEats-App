import 'package:flutter_applications/colors/app_constants.dart';
import 'package:flutter_applications/data/api/api_client.dart';
import 'package:get/get.dart';

class ProductRepo extends GetxService{
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});

  Future<Response> getProductList() async{
      return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}