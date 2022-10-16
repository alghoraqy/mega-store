import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/register/register_cubit.dart';
import 'package:mega_store/bloc/register/register_states.dart';
import 'package:mega_store/modules/Home/Home%20Layout/home_layout.dart';
import 'package:mega_store/modules/SignIn/sign_in_screen.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_string.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/form_field.dart';
import 'package:mega_store/shared/components/my_button.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.only(top: rheight(context) / 30),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: FadeInRight(
                  child: Column(
                    children: [
                      const LogoWithText(
                          firstText: AppString.letsStart,
                          secondText: AppString.create),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: rwidth(context) / 25,
                            vertical: rheight(context) / 30),
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            children: [
                              MyFormField(
                                  hint: 'Full Name',
                                  prefix: Icons.person_outline,
                                  controller: cubit.fullNameController,
                                  inputType: TextInputType.name,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return AppString.emptyfullName;
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: rheight(context) / 80,
                              ),
                              MyFormField(
                                  hint: 'Your Email',
                                  prefix: Icons.mail_outline_outlined,
                                  controller: cubit.emailController,
                                  inputType: TextInputType.emailAddress,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return AppString.emptyEmail;
                                    } else {
                                      if (!value.contains('@')) {
                                        return AppString.notValidEmail;
                                      }
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: rheight(context) / 80,
                              ),
                              MyFormField(
                                  hint: 'Your Phone',
                                  prefix: Icons.call,
                                  controller: cubit.phoneController,
                                  inputType: TextInputType.phone,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return AppString.emptyPhone;
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: rheight(context) / 80,
                              ),
                              MyFormField(
                                  hint: 'Password',
                                  prefix: Icons.lock_outline,
                                  controller: cubit.passwordController,
                                  inputType: TextInputType.visiblePassword,
                                  isPassword: true,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return AppString.emptyPassword;
                                    } else {
                                      if (value.length < 6) {
                                        return AppString.notValidPassword;
                                      }
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: rheight(context) / 80,
                              ),
                              MyFormField(
                                  hint: 'Confirm password',
                                  prefix: Icons.lock_outline,
                                  controller: cubit.confirmPasswordController,
                                  inputType: TextInputType.visiblePassword,
                                  isPassword: true,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return AppString.emptyConfirmPassword;
                                    } else {
                                      if (cubit
                                              .confirmPasswordController.text !=
                                          cubit.passwordController.text) {
                                        return AppString
                                            .notValidConfirmPassword;
                                      }
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: rheight(context) / 30,
                              ),
                              MyButton(
                                  child: Text(
                                    'Sign Up',
                                    style: AppTextStyle.buttonText,
                                  ),
                                  onPressed: () {
                                    if (cubit.formKey.currentState!
                                        .validate()) {
                                      navigatAndReplacement(context,
                                          screen: const HomeLayout());
                                    }
                                  }),
                              SizedBox(
                                height: rheight(context) / 60,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'have a account? ',
                                    style: AppTextStyle.greyBold
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      navigatTo(context,
                                          screen: const SignInScreen());
                                    },
                                    child: Ink(
                                      child: Text('Sign In',
                                          style: AppTextStyle.greyBold.copyWith(
                                            color: AppColors.buttonColor,
                                          )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
