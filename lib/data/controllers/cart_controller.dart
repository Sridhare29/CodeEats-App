import 'package:flutter_applications/models/products.dart';
import 'package:get/get.dart';
import '../../models/cart.dart';
import '../repository/cart_repo.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int,CartModel> _items={};
  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity){


    if(_items.containsKey(product.id!)){
            print("adding item to cart "+product.id!.toString()+"quantity" +quantity.toString());
            _items.forEach((key, value) {
              print("quantity is "+ value.quantity.toString());
            });
      _items.update(product.id!, (value){
        return CartModel(
      id : value.id,
      name: value.name,
      price: value.price,
      img: value.img,
      isExit: true,
      quantity: value.quantity!+quantity,
      time: DateTime.now().toString(),
    );
      } );
    }
else{
      _items.putIfAbsent(product.id!, (){ 
      return CartModel(
      id : product.id,
      name: product.name,
      price: product.price,
      img: product.img,
      isExit: true,
      quantity: quantity,
      time: DateTime.now().toString(),
    );});
}
  }

  bool exitInCart(ProductModel product)
  {
    if(_items.containsKey(product.id)){
      return true;
    }
    return false;
 }

 getQuantity(ProductModel productModel){
  var quantity =0;
  if(_items.containsKey(productModel.id)){
    _items.forEach((key, value) {
        if(key==productModel.id){
          quantity = value.quantity!; 

        }
    });
  }
  return quantity;
 }
}