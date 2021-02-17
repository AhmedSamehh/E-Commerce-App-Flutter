import 'package:ECommerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{
  final String text;
  final String hint;
  final Function onSaved;
  final Function validator;

  const CustomTextFormField({Key key, this.text, this.hint, this.onSaved, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: [
          CustomText(text: text, color: Colors.grey.shade900, fontSize: 14),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Colors.white
            ),
            onSaved: onSaved,
            validator: validator,
          ),
        ],
      ),
    );
  }
}