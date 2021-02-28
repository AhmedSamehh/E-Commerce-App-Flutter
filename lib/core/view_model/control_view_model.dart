import 'package:ECommerce/view/cart_view.dart';
import 'package:ECommerce/view/home_screen.dart';
import 'package:ECommerce/view/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  int _navigatorValue = 0;

  Widget _currentView = HomeScreen();

  get navigatorValue => _navigatorValue;
  get currentView => _currentView;

  void changeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0: {
        _currentView = HomeScreen();
        break;
      }
      case 1: {
        _currentView = CartView();
        break;
      }
      case 2: {
        _currentView = ProfileView();
        break;
      }
    }
    update();
  }
}
