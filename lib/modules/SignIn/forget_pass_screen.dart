import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/Login/login_cubit.dart';
import 'package:mega_store/bloc/Login/login_states.dart';

import 'package:mega_store/modules/SignIn/verification_screen.dart';
import 'package:mega_store/shared/app_string.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/form_field.dart';
import 'package:mega_store/shared/components/my_button.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                child: FadeInRight(
                  child: Column(
                    children: [
                      const LogoWithText(
                        firstText: AppString.forgetPassword,
                        secondText: AppString.forgetPassword2,
                      ),
                      SizedBox(
                        height: rheight(context) / 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: rwidth(context) / 25,
                            vertical: rheight(context) / 30),
                        child: Form(
                          key: cubit.formKeyForgetPassword,
                          child: Column(
                            children: [
                              MyFormField(
                                  hint: ' You email',
                                  prefix: Icons.email_outlined,
                                  controller: cubit.forgetpasswordController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return AppString.emptyEmail;
                                    } else {
                                      if (!value.contains('@')) {
                                        return AppString.notValidEmail;
                                      }
                                    }
                                    return null;
                                  },
                                  inputType: TextInputType.emailAddress),
                              SizedBox(
                                height: rheight(context) / 20,
                              ),
                              MyButton(
                                  child: Text(
                                    'Send',
                                    style: AppTextStyle.buttonText,
                                  ),
                                  onPressed: () {
                                    if (cubit
                                        .formKeyForgetPassword.currentState!
                                        .validate()) {
                                      navigatTo(context,
                                          screen: BlocProvider.value(
                                              value: LoginCubit.get(context),
                                              child:
                                                  const VerificationScreen()));
                                    }
                                  })
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
