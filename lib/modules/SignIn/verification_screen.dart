import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/Login/login_cubit.dart';
import 'package:mega_store/bloc/Login/login_states.dart';
import 'package:mega_store/modules/SignIn/reset_password_screen.dart';
import 'package:mega_store/shared/app_string.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/my_button.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.only(top: rheight(context) / 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const LogoWithText(
                      firstText: AppString.verify, secondText: AppString.check),
                  SizedBox(
                    height: rheight(context) / 5.5,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: rwidth(context) / 25,
                        vertical: rheight(context) / 30),
                    child: MyButton(
                        child: Text(
                          'Verify',
                          style: AppTextStyle.buttonText,
                        ),
                        onPressed: () {
                          navigatTo(context,
                              screen: BlocProvider.value(
                                  value: LoginCubit.get(context),
                                  child: const ResetPasswordScreen()));
                        }),
                  ),
                ],
              ),
            ),
          )),
        );
      },
    );
  }
}
