import 'package:ECommerce/core/view_model/account_view_model.dart';
import 'package:ECommerce/core/view_model/auth_view_model.dart';
import 'package:ECommerce/core/view_model/cart_view_model.dart';
import 'package:ECommerce/core/view_model/control_view_model.dart';
import 'package:ECommerce/core/view_model/home_view_model.dart';
import 'package:ECommerce/util/local_storage_data.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => AccountViewModel());
  }

}