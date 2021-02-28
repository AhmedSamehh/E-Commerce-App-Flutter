import 'package:ECommerce/core/service/home_service.dart';
import 'package:ECommerce/model/category.dart';
import 'package:ECommerce/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  HomeViewModel(){
    getCategory();
    getBestSellingProducts();
  }

  Future<void> getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for(int i = 0; i < value.length; i++){
        _categories.add(CategoryModel.fromJson(value[i].data()));
      }
      _loading.value = false;
      update();
    });
  }

  Future<void> getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSellingProducts().then((value) {
      for(int i = 0; i < value.length; i++){
        _products.add(ProductModel.fromJson(value[i].data()));
      }
      _loading.value = false;
      update();
    });
  }
}