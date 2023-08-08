import 'package:get/get.dart';
import '../../models/cart.dart';
import '../repository/cart_repo.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int,CartModel> items={};
}