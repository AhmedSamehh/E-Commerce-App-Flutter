import 'package:ECommerce/constant.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final String text;
  final Color textColor;
  final Function onPressed;
  final Alignment alignment;

  const CustomButton({Key key , this.text, this.textColor, this.onPressed, this.alignment}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return FlatButton(
      child:  CustomText(text: text, alignment: Alignment.center, color: textColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(15),
      color: primaryColor,
      onPressed: onPressed,
    );
  }
}