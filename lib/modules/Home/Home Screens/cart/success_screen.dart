import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/modules/Home/Home%20Layout/home_layout.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/my_button.dart';
import 'package:mega_store/shared/hex_colors.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
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
                        shape: BoxShape.circle, color: HexColor('#1B8900')),
                    child: const Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: rheight(context) / 50,
                  ),
                  Text(
                    'Success',
                    style: AppTextStyle.appBar
                        .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: rheight(context) / 50,
                  ),
                  Column(
                    children: [
                      Text(
                        'Thank You for Shipping from',
                        style: AppTextStyle.appBar
                            .copyWith(color: AppColors.grey, fontSize: 18),
                      ),
                      Text(
                        'MEGA Store',
                        style: AppTextStyle.appBar
                            .copyWith(color: AppColors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: rheight(context) / 20,
                  ),
                  MyButton(
                      color: AppColors.lightblack,
                      child: Text(
                        'Back To Home',
                        style: AppTextStyle.buttonText
                            .copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                      AppCubit.get(context).signOut(context);
                      })
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
