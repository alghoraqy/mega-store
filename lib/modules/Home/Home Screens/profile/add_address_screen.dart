import 'package:flutter/material.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/my_button.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(context, title: 'Add Address', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: rwidth(context) / 30, vertical: rheight(context) / 70),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ButtomSheetForm(
                title: 'Country or Region',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: rheight(context) / 60,
              ),
              ButtomSheetForm(
                title: 'Street Address',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: rheight(context) / 60,
              ),
              ButtomSheetForm(
                title: 'Street Address 2 (Optional)',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: rheight(context) / 60,
              ),
              ButtomSheetForm(
                title: 'State/Province/Region',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: rheight(context) / 60,
              ),
              ButtomSheetForm(
                title: 'City',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: rheight(context) / 60,
              ),
              ButtomSheetForm(
                title: 'Zip Code',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: rheight(context) / 60,
              ),
              ButtomSheetForm(
                title: 'Phone Number',
                hint: '',
                fontSize: 16,
              ),
              SizedBox(
                height: rheight(context) / 60,
              ),
              MyButton(
                  color: AppColors.brown,
                  child: Text(
                    'add address',
                    style: AppTextStyle.buttonText,
                  ),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
