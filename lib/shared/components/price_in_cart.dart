import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/hex_colors.dart';
import 'package:mega_store/shared/responsive.dart';

// ignore: must_be_immutable
class PriceInCart extends StatelessWidget {
  dynamic itemsPrice;
  final double shippingPrice;
  final double importChargesPrice;
  dynamic totalPrice;
  final int numOfItems;

  PriceInCart(
      {super.key,
      required this.itemsPrice,
      required this.shippingPrice,
      required this.importChargesPrice,
      required this.numOfItems,
      required this.totalPrice});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context,state){},
      builder: (context,stste){
        return  Container(
        padding: EdgeInsets.symmetric(
          horizontal: rwidth(context) / 100,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.grey.withOpacity(.5))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: rwidth(context) / 60, vertical: rheight(context) / 70),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Items ($numOfItems)',
                    style: AppTextStyle.greyBold
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Text(
                    r'$' '$itemsPrice',
                    style: AppTextStyle.appBar
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: rheight(context) / 80,
              ),
              Row(
                children: [
                  Text(
                    'Shipping',
                    style: AppTextStyle.greyBold
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Text(
                    r'$' '$shippingPrice',
                    style: AppTextStyle.appBar
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: rheight(context) / 80,
              ),
              Row(
                children: [
                  Text(
                    'Import charges',
                    style: AppTextStyle.greyBold
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Text(
                    r'$' '$importChargesPrice',
                    style: AppTextStyle.appBar
                        .copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              SizedBox(
                height: rheight(context) / 60,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: rwidth(context) / 20),
                child: const MyDashedSeparator(height: .5),
              ),
              SizedBox(
                height: rheight(context) / 80,
              ),
              Row(
                children: [
                  Text(
                    'Total Price',
                    style: AppTextStyle.appBar.copyWith(fontSize: 15),
                  ),
                  const Spacer(),
                  Text(
                    r'$' '$totalPrice',
                    style: AppTextStyle.appBar
                        .copyWith(fontSize: 15, color: HexColor('#40BFFF')),
                  )
                ],
              ),
            ],
          ),
        ),
      );
      },
    );
  }
}
