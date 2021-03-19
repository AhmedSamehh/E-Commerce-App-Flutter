import 'package:ECommerce/constant.dart';
import 'package:ECommerce/view/control_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutViewModel extends GetxController{
  int get index => _index;
  int _index = 0;

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  String street1, street2, city, state, country;

  GlobalKey<FormState> get formKey => _formKey;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void changeIndex(int i){
    if (i <= 0) {
      _pages = Pages.DeliveryTime;
      _index = i;
    }
    else if (i == 1) {
      _pages = Pages.AddAddress;
      _index = i;
    }
    else if (i == 2) {
      _formKey.currentState.save();
      if(_formKey.currentState.validate()){
        _pages = Pages.Summary;
        _index = i;
      }
    }
    else if (i == 3) {
      _pages = Pages.DeliveryTime;
      Get.to(ControlView());
      _index = 0;
    }
    update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (index < _index) {
      return primaryColor;
    } else {
      return todoColor;
    }
  }
}