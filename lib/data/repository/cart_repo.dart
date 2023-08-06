import 'package:get/get.dart';

import '../../models/cart.dart';
import '../controllers/cart_controller.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int,CartModel> items={};
}