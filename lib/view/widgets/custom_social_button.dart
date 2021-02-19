import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget{
  final String text;
  final String imageAsset;
  final Color textColor;
  final Function onPressed;
  final Alignment alignment;

  const CustomSocialButton({Key key , this.text, this.textColor, this.onPressed, this.alignment, this.imageAsset}) : super(key: key);

  @override
  Widget build (BuildContext context){
    return FlatButton(
      child:  Row(
        children: [
          Image.asset(imageAsset, height: 30),
          SizedBox(width: 50),
          CustomText(text: text, alignment: Alignment.center, color: textColor),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(15),
      color: Colors.grey.shade200,
      onPressed: onPressed,
    );
  }
}