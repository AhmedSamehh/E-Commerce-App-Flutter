import 'package:ECommerce/core/service/firestore_user.dart';
import 'package:ECommerce/model/user.dart';
import 'package:ECommerce/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  String email, password, name;
  Rx<User> _user = Rx<User>();

  String get user => _user.value?.email;
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken
    );
    await _firebaseAuth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(HomeView());
    });
  }

  void facebookLoginMethod() async{
    FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    final accessToken = result.accessToken.token;
    if(result.status == FacebookLoginStatus.loggedIn){
      final facebookCredential = FacebookAuthProvider.credential(accessToken);
      await _firebaseAuth.signInWithCredential(facebookCredential).then((user) {
        saveUser(user);
        Get.offAll(HomeView());
      });
    }
  }

  void signInUsingEmailAndPassword()async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value) {
        print(value);
        Get.offAll(HomeView());
      });
    }
    catch(e){
      print(e.message);
      Get.snackbar('Error login account', e.message,backgroundColor: Colors.red, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccount() async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((user) async {
        saveUser(user);
      });
      Get.offAll(HomeView());
    }
    catch(e){
      print(e.message);
      Get.snackbar('Error login account', e.message,backgroundColor: Colors.red, colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential userCredential) async{
    UserModel user = UserModel(
      userId: userCredential.user.uid,
      email: userCredential.user.email,
      name: name != null ? name : userCredential.user.displayName,
      img: '',
    );
    await FirestoreUser().addUserToFirestore(user);
  }
}