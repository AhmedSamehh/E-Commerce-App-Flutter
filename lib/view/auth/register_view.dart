import 'package:ECommerce/core/view_model/auth_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email, password;

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: "Welcome,", fontSize: 30),
                      CustomText(text: "Sign Up", fontSize: 18, color: primaryColor),
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomText(text: "Sign in to continue", color: Colors.grey, fontSize: 14),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    text: "E-mail",
                    hint: "ahmedwael@gmail.com",
                    onSaved: (value){
                      controller.email = value;
                    },
                    validator: (value){
                      if(value == null){
                        print('ERROR');
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    text: "Password",
                    hint: "********",
                    onSaved: (value){
                      controller.password = value;
                    },
                    validator: (value){
                      if(value == null){
                        print('ERROR');
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  CustomText(text: "Forgot password?", fontSize: 14, alignment: Alignment.topRight),
                  SizedBox(height: 20),
                  CustomButton(
                      text: "SIGN IN",
                      textColor: Colors.white,
                      onPressed: (){
                        _formKey.currentState.save();
                        if(_formKey.currentState.validate()){
                          controller.signInUsingEmailAndPassword();
                        }
                      }
                  ),
                  SizedBox(height: 30),
                  CustomText(text: "- OR -", color: Colors.grey, fontSize: 20, alignment: Alignment.center,),
                  SizedBox(height: 30),
                  CustomSocialButton(
                      text: "Sign in with Facebook",
                      imageAsset:"lib/assets/fb.png",
                      onPressed: (){
                        controller.facebookLoginMethod();
                      }
                  ),
                  SizedBox(height: 40),
                  CustomSocialButton(
                      text: "Sign in with Google",
                      imageAsset:"lib/assets/google.png",
                      onPressed: (){
                        controller.googleSignInMethod();
                      }
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}