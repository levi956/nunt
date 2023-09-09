import 'package:flutter/material.dart';
import 'package:nuntium_rigid/core/core.dart';

class BaseText extends StatefulWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const BaseText(
    this.text, {
    super.key,
    this.fontSize = 13,
    this.fontWeight,
    this.color,
  });

  @override
  State<BaseText> createState() => _BaseTextState();
}

class _BaseTextState extends State<BaseText> with AppThemeMixin {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        color: widget.color ?? colors.lightBlackDarkWhite,
      ),
    );
  }
}
