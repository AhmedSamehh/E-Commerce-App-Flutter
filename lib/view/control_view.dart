import 'package:ECommerce/core/view_model/auth_view_model.dart';
import 'package:ECommerce/view/auth/login_view.dart';
import 'package:ECommerce/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx( () {
      return (Get.find<AuthViewModel>().user != null)
          ? HomeScreen()
          : LoginView();
    });
  }
}
