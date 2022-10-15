import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/Login/login_cubit.dart';
import 'package:mega_store/bloc/Login/login_states.dart';
import 'package:mega_store/modules/Home/Home%20Layout/home_layout.dart';
import 'package:mega_store/modules/SignIn/forget_pass_screen.dart';
import 'package:mega_store/modules/SignUp/sign_up_screen.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_string.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/assets_manager.dart';
import 'package:mega_store/shared/components/form_field.dart';
import 'package:mega_store/shared/components/my_button.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
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
                child: FadeInRight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const LogoWithText(
                          firstText: AppString.welcomeText,
                          secondText: AppString.signToContinue),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: rwidth(context) / 25,
                            vertical: rheight(context) / 30),
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            children: [
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
                                },
                              ),
                              SizedBox(
                                height: rheight(context) / 50,
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
                                },
                              ),
                              SizedBox(
                                height: rheight(context) / 50,
                              ),
                              MyButton(
                                child: Text(
                                  'Sign In',
                                  style: AppTextStyle.buttonText,
                                ),
                                onPressed: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    navigatAndReplacement(context,
                                        screen: const HomeLayout());
                                  }
                                },
                              ),
                              SizedBox(
                                height: rheight(context) / 30,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: rwidth(context) / 2.8,
                                    height: 1,
                                    color: AppColors.grey,
                                  ),
                                  SizedBox(
                                    width: rwidth(context) / 15,
                                  ),
                                  Text(
                                    'OR',
                                    style: AppTextStyle.greyBold,
                                  ),
                                  SizedBox(
                                    width: rwidth(context) / 15,
                                  ),
                                  Container(
                                    width: rwidth(context) / 2.8,
                                    height: 1,
                                    color: AppColors.grey,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: rheight(context) / 50,
                              ),
                              MyButton(
                                color: Colors.white,
                                elevation: 0,
                                onPressed: () {},
                                borderSide: BorderSide(
                                    color: AppColors.grey.withOpacity(.3),
                                    width: 1),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: rwidth(context) / 12),
                                  child: Row(
                                    children: [
                                      Image(
                                        image:
                                            const AssetImage(ImgAsset.google),
                                        height: rheight(context) / 25,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: rwidth(context) / 8.5,
                                      ),
                                      Text(
                                        'Login with Google',
                                        style: AppTextStyle.greyBold,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: rheight(context) / 80,
                              ),
                              MyButton(
                                color: Colors.white,
                                elevation: 0,
                                onPressed: () {},
                                borderSide: BorderSide(
                                    color: AppColors.grey.withOpacity(.3),
                                    width: 1),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: rwidth(context) / 12),
                                  child: Row(
                                    children: [
                                      Image(
                                        image:
                                            const AssetImage(ImgAsset.facebook),
                                        height: rheight(context) / 25,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: rwidth(context) / 8.5,
                                      ),
                                      Text(
                                        'Login with Facebook',
                                        style: AppTextStyle.greyBold,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: rheight(context) / 100,
                              ),
                              InkWell(
                                onTap: () {
                                  navigatTo(context,
                                      screen: BlocProvider.value(
                                          value: LoginCubit.get(context),
                                          child: const ForgetPasswordScreen()));
                                },
                                child: Ink(
                                  child: Text('Forget Password?',
                                      style: AppTextStyle.greyBold.copyWith(
                                        color: AppColors.buttonColor,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: rheight(context) / 90,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have a account? ',
                                    style: AppTextStyle.greyBold
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      navigatTo(context,
                                          screen: const SignUpScreen());
                                    },
                                    child: Ink(
                                      child: Text('Register',
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
                      )
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
