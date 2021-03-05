import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final double height;
  final int maxLines;
  final Alignment alignment;
  final FontWeight fontWeight;

  const CustomText(
      {Key key,
      this.text = '',
      this.color = Colors.black,
      this.maxLines,
      this.fontSize = 16,
      this.alignment = Alignment.topLeft,
      this.height,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment,
        child: Text(
          text,
          maxLines: maxLines,
          style: TextStyle(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight
          ),
        ));
  }
}
