import 'package:flutter_applications/data/repository/product_repo.dart';
import 'package:flutter_applications/models/products.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final ProductRepo productRepo;
  ProductController({required this.productRepo});
  List<ProductModel> _productList = [];
List<ProductModel> get ProductList => _productList;

Future<void> getProductList() async {
  Response response = await productRepo.getProductList();

  if (response.statusCode == 200) {
    print("Got Product");
    // List<dynamic> jsonResponse = response.body as List<dynamic>;
    // _productList = jsonResponse
    //     .map((product) => ProductModel.fromJson(product))
    //     .toList();
    _productList=[];
    _productList.addAll(Product.fromJson(response.body).products as Iterable<ProductModel>);
    //print(_productList);
    update();
  } else {
    // Handle the error case
  }
}
}