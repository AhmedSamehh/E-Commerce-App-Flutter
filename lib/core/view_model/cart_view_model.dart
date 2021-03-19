import 'package:ECommerce/core/service/database/cart_database_helper.dart';
import 'package:ECommerce/model/cart_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _productsList = [];

  List<CartProductModel> get productsList => _productsList;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  var dbHelper = CartDatabaseHelper.db;

  CartViewModel() {
    getAllProducts();
  }

  getAllProducts() async {
    _loading.value = true;
    _productsList = await dbHelper.getAllProducts();
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    _totalPrice = 0.0;
    for (int i = 0; i < _productsList.length; i++) {
      _totalPrice +=
          (double.parse(_productsList[i].price) * _productsList[i].quantity);
    }
    update();
  }

  addProductToCart(CartProductModel cartProduct, GlobalKey<ScaffoldState> scaffoldKey) async {
    for (int i = 0; i < _productsList.length; i++) {
      if (_productsList[i].productId == cartProduct.productId) {
        increaseQuantity(i);
        showInSnackBar(scaffoldKey);
        return;
      }
    }
    showInSnackBar(scaffoldKey);

    await dbHelper.insertProduct(cartProduct);
    _productsList.add(cartProduct);
    _totalPrice +=
    (double.parse(cartProduct.price) * cartProduct.quantity);
    update();
  }

  increaseQuantity(int index){
    _productsList[index].quantity++;
    _totalPrice += double.parse(_productsList[index].price);
    dbHelper.updateProduct(_productsList[index]);
    update();
  }

  decreaseQuantity(int index){
    if(_productsList[index].quantity > 0) {
      _productsList[index].quantity--;
      _totalPrice -= double.parse(_productsList[index].price);
      dbHelper.updateProduct(_productsList[index]);
      if( _productsList[index].quantity == 0){
        dbHelper.removeProduct(_productsList[index]);
        _productsList.removeAt(index);
      }
    }
    update();
  }

  showInSnackBar( GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Added to cart!"),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.all(5),
          action: SnackBarAction(
            label: "Ok",
            textColor: Colors.white,
            onPressed: (){
              scaffoldKey.currentState.hideCurrentSnackBar();
            },
          ),
          backgroundColor: Colors.green,
        )
    );
  }
}
