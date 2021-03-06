import 'dart:convert';

import 'package:ECommerce/constant.dart';
import 'package:ECommerce/model/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController{

  Future<UserModel> get getUser async{
    try{
      UserModel user = await _getUserData();
      if(user == null){
        return null;
      }
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  setUser(UserModel userModel) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CACHED_USER_DATA, jsonEncode(userModel));
  }

  _getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString(CACHED_USER_DATA);
    return UserModel.fromJson(jsonDecode(user));
  }

  void deleteUserFromLocalStorage() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}