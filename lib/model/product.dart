class ProductModel {
  String title;
  String desc;
  String price;
  String imageUrl;
  String color;
  String size;

  ProductModel({
      this.title,
      this.desc,
      this.price,
      this.imageUrl,
      this.color,
      this.size});

  ProductModel.fromJson(Map<dynamic, dynamic> map){
    if(map == null ){
      return;
    }
    title = map['title'];
    desc = map['desc'];
    price = map['price'];
    imageUrl = map['imageUrl'];
    color = map['color'];
    size = map['size'];
  }

  Map<dynamic,dynamic> toJson(){
    return{
      "title": title,
      "desc": desc,
      "price": price,
      "imageUrl": imageUrl,
      "color": color,
      "size": size,
    };
  }
}