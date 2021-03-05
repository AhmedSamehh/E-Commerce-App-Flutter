class CartProductModel{
  String title;
  String imageUrl;
  String price;
  int quantity;

  CartProductModel({this.title, this.imageUrl, this.price, this.quantity});

  CartProductModel.fromJson(Map<dynamic, dynamic> map){
    if(map == null){
      return;
    }
    title = map['title'];
    imageUrl = map['imageUrl'];
    price = map['price'];
    quantity = map['quantity'];
  }

  toJson(){
    return{
      'title' : title,
      'imageUrl' : imageUrl,
      'price' : price,
      'quantity' : quantity
    };
  }
}