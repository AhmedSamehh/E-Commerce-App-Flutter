import 'package:ECommerce/view/cart_view.dart';
import 'package:ECommerce/view/home_view.dart';
import 'package:ECommerce/view/account_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  Widget _currentView = HomeView();

  get navigatorValue => _navigatorValue;
  get currentView => _currentView;

  void changeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0: {
        _currentView = HomeView();
        break;
      }
      case 1: {
        _currentView = CartView();
        break;
      }
      case 2: {
        _currentView = AccountView();
        break;
      }
    }
    update();
  }
}
