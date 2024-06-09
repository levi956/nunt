import 'package:flutter/material.dart';
import 'package:nuntium_rigid/core/core.dart';

class CustomButton extends StatefulWidget {
  final bool? expanded;
  final String? text;
  final Color? color;
  final VoidCallback? onPressed;
  final Color? textColor;
  final EdgeInsets? padding;
  final bool Function()? validator;
  final double? width;

  const CustomButton({
    super.key,
    this.expanded = false,
    required this.text,
    this.color,
    required this.onPressed,
    this.textColor,
    this.padding,
    this.validator,
    this.width,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> with AppThemeMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? (widget.expanded! ? double.maxFinite : null),
      child: ElevatedButton(
        onPressed: (widget.validator == null ? true : widget.validator!())
            ? widget.onPressed
            : null,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            widget.padding ??
                const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
          ),
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor:
              (widget.validator == null ? true : widget.validator!())
                  ? MaterialStateProperty.all(
                      widget.color ?? colors.always475AD7,
                    )
                  : MaterialStateProperty.all(
                      (widget.color ?? colors.always475AD7).withOpacity(0.5)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: Text(
          "${widget.text}",
          style: TextStyle(
            color: widget.textColor ?? Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
