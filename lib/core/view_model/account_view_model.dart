import 'package:ECommerce/util/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountViewModel extends GetxController{
  final LocalStorageData localStorageData = Get.find();
  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUserFromLocalStorage();
  }
}