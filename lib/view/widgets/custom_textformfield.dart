import 'package:ECommerce/constant.dart';
import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{
  final String text;
  final String hint;
  final Function onSaved;
  final Function validator;
  final TextInputType inputType;
  final bool isPassword;

  const CustomTextFormField({Key key, this.text, this.hint, this.onSaved, this.validator, this.inputType, this.isPassword = false}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              border:  OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              labelText: text,
              labelStyle: TextStyle(color: primaryColor),
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white,
            ),
            obscureText: isPassword,
            keyboardType: inputType,
            onSaved: onSaved,
            validator: validator,
            textCapitalization: TextCapitalization.sentences,
          ),
        ],
      ),
    );
  }
}