import 'package:ECommerce/core/view_model/account_view_model.dart';
import 'package:ECommerce/util/binding.dart';
import 'package:ECommerce/core/view_model/cart_view_model.dart';
import 'package:ECommerce/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  // Get.put(AccountViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        body: ControlView(),
      )
    );
  }
}