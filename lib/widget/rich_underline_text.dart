import 'package:flutter/material.dart';
import 'package:vorkinsta/values/app_colors.dart';

class RichUnderlineText extends StatelessWidget {
  final List<String> text;
  final int index;
  final double? size;
  const RichUnderlineText(
      {Key? key, required this.text, required this.index, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            children: text.map((e) {
      int i = text.indexOf(e);
      if (i == index) {
        return TextSpan(
            text: e,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.darkBlue,
              decoration: TextDecoration.underline,
              decorationThickness: 1,
              fontSize: size,
            ));
      }
      return TextSpan(
          text: e + " ",
          style: TextStyle(
              color: AppColors.darkBlue,
              fontWeight: FontWeight.bold,
              fontSize: size));
    }).toList()));
  }
}
