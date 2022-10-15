import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/my_button.dart';
import 'package:mega_store/shared/components/profile_tile.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: myAppbar(context, title: 'Profile', isBack: true),
          body: Padding(
            padding: EdgeInsets.only(
                left: rwidth(context) / 50,
                right: rwidth(context) / 50,
                top: rheight(context) / 25),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    myBottomSheet(
                        isControlled: true,
                        context,
                        child: SizedBox(
                          height: rheight(context) / 2.3,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: rwidth(context) / 30,
                                vertical: rheight(context) / 60),
                            child: Column(
                              children: [
                                ButtomSheetForm(
                                    title: 'First Name',
                                    hint: 'enter your first name'),
                                SizedBox(
                                  height: rheight(context) / 50,
                                ),
                                ButtomSheetForm(
                                    title: 'Last Name',
                                    hint: 'Enter your last name'),
                                const Spacer(),
                                MyButton(
                                    color: AppColors.brown,
                                    onPressed: () {},
                                    child: Text(
                                      'Save',
                                      style: AppTextStyle.buttonText,
                                    ))
                              ],
                            ),
                          ),
                        ));
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: rwidth(context) / 50),
                    child: Row(
                      children: [
                        Container(
                          height: rheight(context) / 9.5,
                          width: rwidth(context) / 4,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: const ImageWithFadeIn(
                              image:
                                  'http://images4.fanpop.com/image/photos/19400000/rainbow-sky-beautiful-pictures-19401741-1093-614.jpg'),
                        ),
                        SizedBox(
                          width: rwidth(context) / 50,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mahmoud Alghoraqy',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    AppTextStyle.profile.copyWith(fontSize: 18),
                              ),
                              SizedBox(
                                height: rheight(context) / 70,
                              ),
                              Text(
                                '@Mahmoud_Alghoraqy',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    AppTextStyle.details.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: rheight(context) / 20,
                ),
                ProfileTile(
                    title: 'Email',
                    icon: Icons.email_outlined,
                    onpressed: () {
                      myBottomSheet(
                          isControlled: true,
                          context,
                          child: SizedBox(
                            height: rheight(context) / 3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: rwidth(context) / 30,
                                  vertical: rheight(context) / 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ButtomSheetForm(
                                      title: 'Change Emil',
                                      hint: 'enter your Updated email'),
                                  SizedBox(
                                    height: rheight(context) / 80,
                                  ),
                                  Text(
                                    'We Will Send verification to your New Email',
                                    style: AppTextStyle.details
                                        .copyWith(fontSize: 12),
                                  ),
                                  const Spacer(),
                                  MyButton(
                                      color: AppColors.brown,
                                      onPressed: () {},
                                      child: Text(
                                        'Save',
                                        style: AppTextStyle.buttonText,
                                      ))
                                ],
                              ),
                            ),
                          ));
                    },
                    trail: 'mahmoudlghoraqy@gmail.com'),
                SizedBox(
                  height: rheight(context) / 70,
                ),
                ProfileTile(
                    title: 'phone number',
                    icon: Icons.phone_android,
                    onpressed: () {
                      myBottomSheet(context,
                          isControlled: true,
                          child: SizedBox(
                            height: rheight(context) / 3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: rwidth(context) / 30,
                                  vertical: rheight(context) / 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ButtomSheetForm(
                                      title: 'Phone Number',
                                      hint: 'enter your phone number'),
                                  SizedBox(
                                    height: rheight(context) / 80,
                                  ),
                                  const Spacer(),
                                  MyButton(
                                      color: AppColors.brown,
                                      onPressed: () {},
                                      child: Text(
                                        'Save',
                                        style: AppTextStyle.buttonText,
                                      ))
                                ],
                              ),
                            ),
                          ));
                    },
                    trail: '+2012345689'),
                SizedBox(
                  height: rheight(context) / 70,
                ),
                ProfileTile(
                    title: 'change password',
                    icon: Icons.lock_outline,
                    onpressed: () {
                      myBottomSheet(context,
                          isControlled: true,
                          child: SizedBox(
                            height: rheight(context) / 1.7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: rwidth(context) / 30,
                                  vertical: rheight(context) / 60),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ButtomSheetForm(
                                      title: 'Old Password',
                                      hint: 'enter your old password'),
                                  SizedBox(
                                    height: rheight(context) / 80,
                                  ),
                                  ButtomSheetForm(
                                      title: 'New Password',
                                      hint: 'enter your New password'),
                                  SizedBox(
                                    height: rheight(context) / 80,
                                  ),
                                  ButtomSheetForm(
                                      title: 'New Password again',
                                      hint: 'enter your new password'),
                                  SizedBox(
                                    height: rheight(context) / 80,
                                  ),
                                  const Spacer(),
                                  MyButton(
                                      color: AppColors.brown,
                                      onPressed: () {},
                                      child: Text(
                                        'Save',
                                        style: AppTextStyle.buttonText,
                                      ))
                                ],
                              ),
                            ),
                          ));
                    },
                    trail: ''),
                SizedBox(
                  height: rheight(context) / 70,
                ),
                ProfileTile(
                    title: 'change Lang',
                    icon: Icons.language_outlined,
                    onpressed: () {
                      myBottomSheet(context,
                          isControlled: true,
                          child: BlocProvider.value(
                            value: AppCubit.get(context),
                            child: BlocConsumer<AppCubit, AppStates>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                AppCubit cubit = AppCubit.get(context);
                                return SizedBox(
                                  height: rheight(context) / 3,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: rwidth(context) / 30,
                                        vertical: rheight(context) / 60),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Choose Language',
                                          style: AppTextStyle.appBar,
                                        ),
                                        SizedBox(
                                          height: rheight(context) / 60,
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButtonFormField(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                              isExpanded: true,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              value: cubit.selectedlanguage,
                                              items: const [
                                                DropdownMenuItem(
                                                  value: 'English',
                                                  child: Text('English'),
                                                ),
                                                DropdownMenuItem(
                                                  value: 'arabic',
                                                  child: Text('arabic'),
                                                ),
                                              ],
                                              onChanged: (value) {
                                                cubit.chooseLang(value!);
                                              }),
                                        ),
                                        const Spacer(),
                                        MyButton(
                                            color: AppColors.brown,
                                            onPressed: () {},
                                            child: Text(
                                              'Save',
                                              style: AppTextStyle.buttonText,
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ));
                    },
                    trail: ''),
              ],
            ),
          ),
        );
      },
    );
  }
}
