import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomText extends StatefulWidget {
  final String? data;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final bool lineThrough;

  const CustomText(this.data,
      {Key? key,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign,
      this.textOverflow = TextOverflow.visible,
      this.lineThrough = false})
      : super(key: key);

  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data ?? '',
      textAlign: widget.textAlign ?? TextAlign.start,
      style: TextStyle(
          fontSize: widget.fontSize ?? 12,
          fontWeight: widget.fontWeight ?? FontWeight.normal,
          color: widget.color ?? Colors.black,
          decoration: widget.lineThrough
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          decorationThickness: 2),
      overflow: widget.textOverflow,
    );
  }
}
