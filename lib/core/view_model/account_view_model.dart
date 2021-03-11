import 'package:ECommerce/model/user.dart';
import 'package:ECommerce/util/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountViewModel extends GetxController{
  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  final LocalStorageData localStorageData = Get.find();
  UserModel get user => _user;
  UserModel _user;

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUserFromLocalStorage();
  }

  void getCurrentUser()async {
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _user = value;
    });
    _loading.value = false;
    update();
  }
}