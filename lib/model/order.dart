import 'package:ECommerce/model/address.dart';
import 'package:ECommerce/model/cart_product.dart';

class OrderModel {
  String userId;
  String dateTime;
  Address address;
  List<CartProductModel> products;

  OrderModel({this.userId, this.dateTime, this.address, this.products});


  OrderModel.fromJson(Map<dynamic, dynamic> map){
    if(map == null){
      return;
    }
    userId = map['userId'];
    dateTime = map['dateTime'];
    address = map['address'];
    products = map['products'];
  }

  toJson(){
    return {
      'userId': userId,
      'dateTime': dateTime,
      'address': address,
      'products': products,
    };
  }
}