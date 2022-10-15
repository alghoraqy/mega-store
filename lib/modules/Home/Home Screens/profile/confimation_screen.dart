import 'package:flutter/material.dart';
import 'package:mega_store/modules/Home/Home%20Layout/home_layout.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/my_button.dart';
import 'package:mega_store/shared/hex_colors.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: rwidth(context) / 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: rheight(context) / 10,
                  width: rwidth(context),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: HexColor('#FB7181')),
                  child: const Icon(
                    Icons.priority_high,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: rheight(context) / 50,
                ),
                Text(
                  'Confirmation',
                  style: AppTextStyle.appBar
                      .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: rheight(context) / 50,
                ),
                Column(
                  children: [
                    Text(
                      'Are you sure wanna delete your account',
                      style: AppTextStyle.appBar
                          .copyWith(color: AppColors.grey, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: rheight(context) / 20,
                ),
                MyButton(
                    child: Text(
                      'Delete',
                      style:
                          AppTextStyle.buttonText.copyWith(color: Colors.white),
                    ),
                    onPressed: () {
                      navigatAndReplacement(context,
                          screen: const HomeLayout());
                    }),
                SizedBox(
                  height: rheight(context) / 50,
                ),
                MyButton(
                    elevation: 0,
                    borderSide: BorderSide(width: .5, color: AppColors.grey),
                    color: Colors.white,
                    child: Text(
                      'Cancel',
                      style: AppTextStyle.buttonText
                          .copyWith(color: AppColors.grey),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ));
  }
}
