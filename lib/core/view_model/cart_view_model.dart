import 'package:ECommerce/core/service/database/cart_database_helper.dart';
import 'package:ECommerce/model/cart_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _productsList = [];
  List<CartProductModel> get productsList => _productsList;

  CartViewModel(){
    getAllProducts();
  }

  addProductToCart(CartProductModel cartProduct) async{
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.insertProduct(cartProduct);
    update();
  }

  getAllProducts() async{
    _loading.value = true;
    var dbHelper = CartDatabaseHelper.db;
    _productsList =  await dbHelper.getAllProducts();
    _loading.value = false;
    update();
  }
}