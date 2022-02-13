import 'package:flutter/material.dart';
import 'package:zam/core/extension/context_extension.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final Icon? prefixIcon;
  final TextInputType? textInputType;
  final bool? isPassword;
  final TextEditingController? controller;
  final void Function()? onTap;
  final  Function(String val)? onChange;
  final bool? readOnly;
  final Color? fillColor;
  final bool? insideHint;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool? isNumber;
  final Widget? isSuffixIcon;

  const CustomTextFormField(
      {BuildContext? context,
        Key? key,
        this.hintText,
        this.prefixIcon,
        this.textInputType,
        this.isPassword = false,
        @required this.controller,
        this.onTap,
        this.onChange,
        this.readOnly = false,
        this.fillColor,
        this.insideHint = false,
        this.focusNode,
        this.validator,
        this.isNumber = false,
        this.isSuffixIcon})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool passwordVisible = false;
  late FocusNode focus;
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
    focus = widget.focusNode ?? FocusNode();
    if (widget.controller!.text.isNotEmpty) {
      isEmpty = false;
    }
    // KeyboardVisibilityController().onChange.listen((event) {
    //   // print(event);
    //   if (!event) {
    //     focus.unfocus();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!widget.insideHint!)
            widget.hintText != null
                ? CustomText(
              widget.hintText,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: context.themeData.primaryTextTheme.bodyText1!.color,
            )
                : const SizedBox(),
          const SizedBox(height: 10),
          TextFormField(
            autofocus: false,
            obscureText: widget.isPassword!,
            readOnly: widget.readOnly!,
            // inputFormatters: [if (widget.isNumber!) Helper.NumberFormatter],
            onChanged: (value) {

              widget.onChange!(value);
              setState(() {
                isEmpty = value.isEmpty;
              });
            },
            decoration: InputDecoration(

                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.isSuffixIcon,
                errorStyle: const TextStyle(fontSize: 16),
                hintText: widget.insideHint! ? widget.hintText ?? '' : '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),

                hintStyle: TextStyle(
                    color: Colors.grey),
                filled: true,
                fillColor: Colors.white),
            keyboardType: widget.textInputType ?? TextInputType.text,
            controller: widget.controller,
            // onEditingComplete: () => FocusScope.of(context).nextFocus(),
            textInputAction: TextInputAction.next,
            focusNode: focus,
            onTap: widget.onTap,
            validator: widget.validator,
            autovalidateMode: AutovalidateMode.always,
            //textCapitalization: TextCapitalization.sentences,
          ),
        ],
      ),
    );
  }
}
