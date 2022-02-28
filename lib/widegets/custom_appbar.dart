import 'package:api_learn/widegets/custom_text.dart';
import 'package:flutter/material.dart';

// Custom App Bar
class CrBar extends StatelessWidget implements PreferredSizeWidget {
  // For text in appbar
  //final String? text;
  //For background color
  final Color? backgroundColor;
  // for leading
  final Widget? title;
  // for shape
  final ShapeBorder? shape;
  // for elevation
  final double? elevation;
  // actions list
  final List<Widget>? actions;
  // for center title
  final bool? centerTitle;
  // foreground color
  final Color? foregroundColor;
  // shadow color
  final Color? shadowColor;
  // title text style
  final TextStyle? titleTextStyle;
// for leading
  final Widget? leading;
  const CrBar({
    Key? key,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.centerTitle,
    this.elevation,
    this.foregroundColor,
    this.shadowColor,
    this.shape,
    //this.text,
    this.title,
    this.titleTextStyle,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: title,
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      titleTextStyle: titleTextStyle,
      foregroundColor: foregroundColor,
      leading: leading,
    );
  }
}
