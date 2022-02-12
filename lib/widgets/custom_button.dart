import 'package:flutter/material.dart';
import 'package:zam/core/extension/context_extension.dart';
import 'custom_text.dart';

class CustomButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String? text;
  final double? fontSize;
  final Color? buttonColor;
  final Color? textColor;
  final Widget? child;
  final void Function()? onPressed;
  final double? radius;
  final FontWeight? textFontWeight;

  const CustomButton(
      {Key? key,
      this.width,
      this.height,
      this.text,
      this.onPressed,
      this.buttonColor,
      this.textColor,
      this.child,
      this.fontSize,
      this.radius,
      this.textFontWeight})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? context.dynamicWidth(0.28),
      height: widget.height ?? context.dynamicHeight(0.05),
      child: ElevatedButton(
        onPressed: widget.onPressed ?? () {},
        style: ElevatedButton.styleFrom(
            primary: widget.buttonColor ?? Colors.blue),
        child: widget.child ??
            CustomText(
              widget.text ?? 'Button Text',
              textAlign: TextAlign.center,
              color: widget.textColor ?? Colors.white,
              fontSize: widget.fontSize,
              fontWeight: widget.textFontWeight ?? FontWeight.normal,
            ),
      ),
    );
  }
}
