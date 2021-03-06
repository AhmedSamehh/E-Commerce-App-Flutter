import 'package:ECommerce/util/extension.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  String title;
  String desc;
  String price;
  String imageUrl;
  Color color;
  String size;
  String productId;

  ProductModel({
      this.title,
      this.desc,
      this.price,
      this.imageUrl,
      this.color,
      this.size,
      this.productId
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map){
    if(map == null ){
      return;
    }
    title = map['title'];
    desc = map['desc'];
    price = map['price'];
    imageUrl = map['imageUrl'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    productId = map['productId'];
  }

  Map<dynamic,dynamic> toJson(){
    return{
      "title": title,
      "desc": desc,
      "price": price,
      "imageUrl": imageUrl,
      "color": color,
      "size": size,
      "productId": productId,
    };
  }
}