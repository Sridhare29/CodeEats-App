import 'package:flutter_applications/data/repository/product_repo.dart';
import 'package:flutter_applications/models/products.dart';
import 'package:get/get.dart';

import '../repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedproductRepo;
  RecommendedProductController({required this.recommendedproductRepo});
 List<ProductModel> _recommendedproductList = [];
List<ProductModel> get RecommendedProductList => _recommendedproductList;
bool _isLoader = false;
bool get isLoaded => _isLoader;
Future<void> getRecommendedProductList() async {
  Response response = await recommendedproductRepo.getRecommendedProductList();

  if (response.statusCode == 200) {
    print("Got Recommended Product");
    _recommendedproductList=[];
    _recommendedproductList.addAll(Product.fromJson(response.body).products as Iterable<ProductModel>);
    _isLoader = true;
    update();
  } else {
    // Handle the error case
  }
}
}