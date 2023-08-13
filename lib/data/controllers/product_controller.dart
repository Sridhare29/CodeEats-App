import 'package:flutter_applications/colors/colors.dart';
import 'package:flutter_applications/data/controllers/cart_controller.dart';
import 'package:flutter_applications/data/repository/product_repo.dart';
import 'package:flutter_applications/models/products.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  final ProductRepo productRepo;
  ProductController({required this.productRepo});
  List<ProductModel> _productList = [];
  late CartController _cart;

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
    print("decrement "+_quanity.toString());
  }
update();
}
checkQuantity(int quantity)
{
  if(_inCartItems+quantity<0){
    Get.snackbar("Item Count", "You can't reduce more!",backgroundColor: AppColors.mainColor,colorText: AppColors.buttonBackgroundColor);
    return 0;
  }
  else if(_inCartItems+quantity>20){
    Get.snackbar("Item Count", "You can't add more!",backgroundColor: AppColors.mainColor,colorText: AppColors.buttonBackgroundColor);
    return 20;
  }
  else{
    return quantity;
  }
}
void initProduct(ProductModel productModel,CartController cart)
{
  _quanity = 0;
  _inCartItems = 0;
  _cart = cart;
  var exist =false;
  exist = _cart.exitInCart(productModel);
  print("exsist or not "+exist.toString());
  if(exist){
    _inCartItems = _cart.getQuantity(productModel);
  }
  print("quantity in the cart is "+_inCartItems.toString());
}

void addItem(ProductModel product )
{
  // if(_quanity>0){
  _cart.addItem(product, _quanity);
  _quanity=0;
  _inCartItems = _cart.getQuantity(product);
  _cart.items.forEach((key, value) {
    print("The id is "+value.id.toString()+"The quantity is "+value.quantity.toString());
  });
  // }
  // else{
        // Get.snackbar("Item Count", "You should add atleast on item in cart!",
        // backgroundColor: AppColors.mainColor,
        // colorText: AppColors.buttonBackgroundColor);
  // }
}
}