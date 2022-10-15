import 'package:flutter/material.dart';
import 'package:mega_store/shared/app_colors.dart';

class AppTextStyle {
  static TextStyle loginHead1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle loginHead2 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static TextStyle buttonText = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle greyBold = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.grey,
  );

  static TextStyle categoryStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.categoryName,
  );

  static TextStyle sideTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    shadows: const [
      Shadow(blurRadius: 5, color: Colors.grey, offset: Offset(0, 3))
    ],
    color: AppColors.buttonColor,
  );
  static TextStyle itemName = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static TextStyle discount = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.grey,
      decoration: TextDecoration.lineThrough);

  static TextStyle appBar = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static TextStyle details = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: AppColors.description,
  );

  static TextStyle profile = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
}
