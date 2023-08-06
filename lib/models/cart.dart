class CartModel {
  int? id;
  String? name;
  int? price;
  int? quantity;
  String? img;
  bool? isExit;
  String? time;


  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.isExit,
      this.quantity,
      this.time,
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    isExit = json['isExit'];
    quantity = json['quantity'];
    time = json['time'];

  }
}