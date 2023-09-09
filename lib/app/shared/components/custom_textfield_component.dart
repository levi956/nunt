import 'package:flutter/material.dart';
import 'package:nuntium_rigid/core/core.dart';

class CustomTextField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final Widget? iconSuffix;
  final Widget? iconLabel;
  final bool isHidden;
  final String? Function(String?)? validator;

  const CustomTextField(
      {Key? key,
      this.controller,
      this.iconLabel,
      this.iconSuffix,
      required this.isHidden,
      this.label,
      this.validator})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> with AppThemeMixin {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      obscureText: widget.isHidden,
      cursorColor: colors.always475AD7,
      controller: widget.controller,
      validator: widget.validator,
      style: const TextStyle(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: colors.lightF3F4F6DarkF3F4F6,
        filled: true,
        focusColor: colors.lightF3F4F6DarkF3F4F6,
        prefixIcon: widget.iconLabel,
        suffixIcon: widget.iconSuffix,
        labelText: widget.label,
        labelStyle: const TextStyle(fontWeight: FontWeight.w400),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colors.always475AD7),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colors.lightF3F4F6DarkF3F4F6),
        ),
        errorBorder: OutlineInputBorder(
          gapPadding: 2,
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colors.always475AD7),
        ),
      ),
    );
  }
}
