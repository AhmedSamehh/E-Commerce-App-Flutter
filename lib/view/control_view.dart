import 'package:ECommerce/core/view_model/auth_view_model.dart';
import 'package:ECommerce/core/view_model/control_view_model.dart';
import 'package:ECommerce/view/auth/login_view.dart';
import 'package:ECommerce/view/cart_view.dart';
import 'package:ECommerce/view/home_view.dart';
import 'package:ECommerce/view/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {

  Widget _bottomNavBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
          currentIndex: controller.navigatorValue,
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(color: Colors.black, size: 30),
          onTap: (index) {
            controller.changeSelectedValue(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginView()
          : GetBuilder<ControlViewModel>(
          builder: (controller) =>
            Scaffold(
              bottomNavigationBar: _bottomNavBar(),
              body: controller.currentView
            )
        );
    });
  }
}
