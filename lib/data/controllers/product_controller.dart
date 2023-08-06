import 'package:flutter_applications/colors/colors.dart';
import 'package:flutter_applications/data/repository/product_repo.dart';
import 'package:flutter_applications/models/products.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final ProductRepo productRepo;
  ProductController({required this.productRepo});
  List<ProductModel> _productList = [];
List<ProductModel> get ProductList => _productList;
bool _isLoader = false;
bool get isLoaded => _isLoader;

int _quanity = 0;
int _inCartItems = 0;
int get quantiy => _quanity;
int get inCartItems => _inCartItems+_quanity;

Future<void> getProductList() async {
  Response response = await productRepo.getProductList();

  if (response.statusCode == 200) {
    print("Got Product");

    _productList=[];
    _productList.addAll(Product.fromJson(response.body).products as Iterable<ProductModel>);
    _isLoader = true;
    //print(_productList);
    update();
  } else {
    // Handle the error case
  }
}

void  setQuantity(bool isIncrement)
{
  if(isIncrement){
    _quanity = checkQuantity(_quanity + 1);
  }
  else
  {
    _quanity = checkQuantity(_quanity - 1);
  }
update();
}
checkQuantity(int quantity)
{
  if(quantity<0){
    Get.snackbar("Item Count", "You can't reduce more!",backgroundColor: AppColors.mainColor,colorText: AppColors.buttonBackgroundColor);
    return 0;
  }
  else if(quantity>20){
        Get.snackbar("Item Count", "You can't add more!",backgroundColor: AppColors.mainColor,colorText: AppColors.buttonBackgroundColor);
    return 20;
  }
  else{
    return quantity;
  }
}
void initProduct()
{
  _quanity = 0;
  int _inCartItems = 0;
}
}