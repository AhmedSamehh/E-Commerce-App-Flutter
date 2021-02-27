import 'package:ECommerce/constant.dart';
import 'package:ECommerce/core/view_model/auth_view_model.dart';
import 'package:ECommerce/view/auth/login_view.dart';
import 'package:ECommerce/view/widgets/custom_button.dart';
import 'package:ECommerce/view/widgets/custom_social_button.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:ECommerce/view/widgets/custom_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: (){
              Get.off(LoginView());
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black
            )
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomText(text: "Sign Up,", fontSize: 30),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    text: "Name",
                    hint: "Ahmed Wael",
                    onSaved: (value){
                      controller.name = value;
                    },
                    validator: (value){
                      if(value == null){
                        print('ERROR');
                      }
                    },
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  CustomButton(
                      text: "SIGN UP",
                      textColor: Colors.white,
                      onPressed: (){
                        _formKey.currentState.save();
                        if(_formKey.currentState.validate()){
                          controller.createAccount();
                        }
                      }
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}