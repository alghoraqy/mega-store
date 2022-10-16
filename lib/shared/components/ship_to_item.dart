import 'package:flutter/material.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/models/address_model.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/my_button.dart';
import 'package:mega_store/shared/responsive.dart';

class ShipToItem extends StatelessWidget {
  final AddressModel model;
  final VoidCallback onpressed;
  final int index;

  const ShipToItem(
      {super.key,
      required this.model,
      required this.onpressed,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Ink(
        height: rheight(context) / 3.3,
        width: rwidth(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              width: AppCubit.get(context).currentShipToIndex == index ? 1 : .5,
              color: AppCubit.get(context).currentShipToIndex == index
                  ? AppColors.lightBlue
                  : AppColors.grey,
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: rwidth(context) / 35,
              vertical: rheight(context) / 50),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: AppTextStyle.appBar.copyWith(fontSize: 18),
                ),
                SizedBox(
                  height: rheight(context) / 50,
                ),
                Text(
                  model.details,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.details.copyWith(fontSize: 16),
                ),
                SizedBox(
                  height: rheight(context) / 30,
                ),
                Text(
                  model.phone,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.details.copyWith(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: rheight(context) / 50,
                ),
                Row(
                  children: [
                    MyButton(
                      onPressed: () {},
                      width: rwidth(context) / 4,
                      color: AppColors.lightblack,
                      child: Text(
                        'Edit',
                        style: AppTextStyle.buttonText,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.grey,
                          size: 35,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
