import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/modules/Home/Home%20Screens/profile/address_screen.dart';
import 'package:mega_store/modules/Home/Home%20Screens/profile/confimation_screen.dart';
import 'package:mega_store/modules/Home/Home%20Screens/profile/my_orders.dart';
import 'package:mega_store/modules/Home/Home%20Screens/profile/profile_screen.dart';
import 'package:mega_store/modules/SignIn/sign_in_screen.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Account',
          style: AppTextStyle.appBar,
        ),
      ),
      body: FadeInRight(
        duration: const Duration(milliseconds: 200),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: rwidth(context) / 50,
              vertical: rheight(context) / 50),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  navigatTo(context,
                      screen: BlocProvider.value(
                          value: AppCubit.get(context),
                          child: const ProfileScreen()));
                },
                leading: Icon(
                  Icons.person_outline,
                  size: 35,
                  color: AppColors.brown,
                ),
                title: Text(
                  'Profile',
                  style: AppTextStyle.profile,
                ),
              ),
              SizedBox(
                height: rheight(context) / 50,
              ),
              ListTile(
                onTap: () {
                  navigatTo(context, screen: const MyOrdersScreen());
                },
                leading: Icon(
                  Icons.card_travel_sharp,
                  size: 35,
                  color: AppColors.brown,
                ),
                title: Text(
                  'My Orders',
                  style: AppTextStyle.profile,
                ),
              ),
              SizedBox(
                height: rheight(context) / 50,
              ),
              ListTile(
                onTap: () {
                  navigatTo(context,
                      screen: BlocProvider.value(
                          value: AppCubit.get(context),
                          child: const AddressScreen()));
                },
                leading: Icon(
                  Icons.location_on_outlined,
                  size: 35,
                  color: AppColors.brown,
                ),
                title: Text(
                  'Address',
                  style: AppTextStyle.profile,
                ),
              ),
              SizedBox(
                height: rheight(context) / 50,
              ),
              ListTile(
                onTap: () {
                  navigatAndReplacement(context, screen: const SignInScreen());
                },
                leading: Icon(
                  Icons.logout,
                  size: 35,
                  color: AppColors.brown,
                ),
                title: Text(
                  'Log out',
                  style: AppTextStyle.profile,
                ),
              ),
              SizedBox(
                height: rheight(context) / 50,
              ),
              ListTile(
                onTap: () {
                  navigatTo(context, screen: const ConfirmationScreen());
                },
                leading: Icon(
                  Icons.delete,
                  size: 35,
                  color: AppColors.buttonColor,
                ),
                title: Text(
                  'Delete Account',
                  style: AppTextStyle.profile,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
