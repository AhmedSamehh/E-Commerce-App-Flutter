import 'package:ECommerce/constant.dart';
import 'package:ECommerce/view/widgets/custom_button.dart';
import 'package:ECommerce/view/widgets/custom_social_button.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:ECommerce/view/widgets/custom_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
	@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
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
            CustomTextFormField(text: "E-mail", hint: "ahmedwael@gmail.com"),
            SizedBox(height: 20),
            CustomTextFormField(text: "Password", hint: "********"),
            SizedBox(height: 15),
            CustomText(text: "Forgot password?", fontSize: 14, alignment: Alignment.topRight),
            SizedBox(height: 20),
            CustomButton(text: "SIGN IN", textColor: Colors.white, onPressed: (){}),
            SizedBox(height: 30),
            CustomText(text: "- OR -", color: Colors.grey, fontSize: 20, alignment: Alignment.center,),
            SizedBox(height: 30),
            CustomSocialButton(text: "Sign in with Facebook", imageAsset:"lib/assets/fb.png", onPressed: (){}),
            SizedBox(height: 40),
            CustomSocialButton(text: "Sign in with Google", imageAsset:"lib/assets/google.png", onPressed: (){})
          ],
        ),
      )
    );
  }
}