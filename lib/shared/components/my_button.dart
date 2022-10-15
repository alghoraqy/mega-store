import 'package:flutter/material.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/responsive.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  double? elevation;
  Color? color;
  double? height;
  double? width;
  BorderSide? borderSide;

  MyButton(
      {super.key,
      required this.child,
      required this.onPressed,
      this.elevation,
      this.color,
      this.height,
      this.width,
      this.borderSide});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: MaterialButton(
        height: height ?? rheight(context) / 13,
        onPressed: onPressed,
        elevation: elevation ?? 2,
        padding: EdgeInsets.zero,
        color: color ?? AppColors.buttonColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: borderSide ?? BorderSide.none),
        child: child,
      ),
    );
  }
}
