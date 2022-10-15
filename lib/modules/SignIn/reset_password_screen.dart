import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/Login/login_cubit.dart';
import 'package:mega_store/bloc/Login/login_states.dart';
import 'package:mega_store/modules/SignIn/sign_in_screen.dart';
import 'package:mega_store/shared/app_string.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/form_field.dart';
import 'package:mega_store/shared/components/my_button.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: rheight(context) / 30),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const LogoWithText(
                        firstText: AppString.resetPassword, secondText: ''),
                    SizedBox(
                      height: rheight(context) / 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: rwidth(context) / 25,
                          vertical: rheight(context) / 30),
                      child: Form(
                        key: cubit.resetPasswordformKey,
                        child: Column(
                          children: [
                            MyFormField(
                                hint: 'New Password',
                                prefix: Icons.lock_outline_rounded,
                                controller: cubit.resetpasswordController,
                                isPassword: cubit.isPassword1,
                                suffix: cubit.isPassword1
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                suffixPress: () {
                                  cubit.changeVisabilty(1);
                                },
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return AppString.emptyPassword;
                                  } else {
                                    if (value.length < 6) {
                                      return AppString.notValidPassword;
                                    }
                                  }
                                  return null;
                                },
                                inputType: TextInputType.visiblePassword),
                            SizedBox(
                              height: rheight(context) / 50,
                            ),
                            MyFormField(
                                hint: 'Confirm Password',
                                prefix: Icons.lock_outline_rounded,
                                controller:
                                    cubit.confirmResetpasswordController,
                                isPassword: cubit.isPassword2,
                                suffix: cubit.isPassword2
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                suffixPress: () {
                                  cubit.changeVisabilty(2);
                                },
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return AppString.emptyPassword;
                                  } else {
                                    if (cubit.confirmResetpasswordController
                                            .text !=
                                        cubit.resetpasswordController.text) {
                                      return AppString.notValidConfirmPassword;
                                    }
                                  }
                                  return null;
                                },
                                inputType: TextInputType.visiblePassword),
                            SizedBox(
                              height: rheight(context) / 10,
                            ),
                            MyButton(
                                child: Text(
                                  'Conirm',
                                  style: AppTextStyle.buttonText,
                                ),
                                onPressed: () {
                                  if (cubit.resetPasswordformKey.currentState!
                                      .validate()) {
                                    navigatAndReplacement(context,
                                        screen: const SignInScreen());
                                  }
                                })
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
