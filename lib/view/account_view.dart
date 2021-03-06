import 'package:ECommerce/core/view_model/account_view_model.dart';
import 'package:ECommerce/view/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountViewModel>(
      init: AccountViewModel(),
      builder: (controller) => Scaffold(
        body: Center(
            child: RaisedButton(
              child: Text("Sign Out"),
              onPressed: (){
                controller.signOut();
                Get.offAll(LoginView());
              },
            )
        ),
      ),
    );
  }
}
