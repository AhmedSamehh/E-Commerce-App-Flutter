class CartProductModel {
  String productId;
  String title;
  String imageUrl;
  String price;
  int quantity;

  CartProductModel(
      {this.productId, this.title, this.imageUrl, this.price, this.quantity});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['productId'];
    title = map['title'];
    imageUrl = map['imageUrl'];
    price = map['price'];
    quantity = map['quantity'];
  }

  toJson() {
    return {
      'productId': productId,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity
    };
  }
}
