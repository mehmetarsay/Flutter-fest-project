import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zam/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Color? backgroundColor;

  const CustomAppBar({Key? key, this.backgroundColor, this.titleText})
      : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: 0,
      title: titleText != null
          ? CustomText(titleText, fontWeight: FontWeight.bold, fontSize: 18)
          : null,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
