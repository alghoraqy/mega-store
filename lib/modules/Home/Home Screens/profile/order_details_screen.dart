import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/product_in_order.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/components/stepper_component.dart';
import 'package:mega_store/shared/hex_colors.dart';
import 'package:mega_store/shared/responsive.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(context, title: 'Order Details', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: rwidth(context) / 50, vertical: rheight(context) / 40),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const MyStepper(),
              SizedBox(
                height: rheight(context) / 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: rwidth(context) / 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product',
                      style: AppTextStyle.appBar,
                    ),
                    SizedBox(
                      height: rheight(context) / 60,
                    ),
                    SizedBox(
                      height: rheight(context) / 3,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ProductInOrder();
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: rheight(context) / 50,
                            );
                          },
                          itemCount: 3),
                    ),
                    SizedBox(
                      height: rheight(context) / 80,
                    ),
                    Text(
                      'Shipping Details',
                      style: AppTextStyle.appBar,
                    ),
                    Container(
                      height: rheight(context) / 4.8,
                      width: rwidth(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.grey.withOpacity(.5))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: rwidth(context) / 50,
                            vertical: rheight(context) / 80),
                        child: Column(
                          children: [
                            rowItem(context,
                                title: 'Date Shipping',
                                text: 'January 16, 2020'),
                            SizedBox(
                              height: rheight(context) / 50,
                            ),
                            rowItem(context,
                                title: 'Shipping', text: 'POS Reggular'),
                            SizedBox(
                              height: rheight(context) / 50,
                            ),
                            rowItem(context,
                                title: 'No. Resi', text: '000192848573'),
                            SizedBox(
                              height: rheight(context) / 50,
                            ),
                            rowItem(context,
                                title: 'Address',
                                text:
                                    '2727 New  Owerri, Owerri, Imo State 78410'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: rheight(context) / 40,
                    ),
                    Text(
                      'Payment Details',
                      style: AppTextStyle.appBar,
                    ),
                    Container(
                      height: rheight(context) / 4.8,
                      width: rwidth(context),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.grey.withOpacity(.5))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: rwidth(context) / 50,
                            vertical: rheight(context) / 80),
                        child: Column(
                          children: [
                            rowPaymentItem(context,
                                title: 'Items (3)', text: r'$598.86'),
                            SizedBox(
                              height: rheight(context) / 50,
                            ),
                            rowPaymentItem(context,
                                title: 'Shipping', text: r'$40.00'),
                            SizedBox(
                              height: rheight(context) / 50,
                            ),
                            rowPaymentItem(context,
                                title: 'Import charges', text: r'$128.00'),
                            SizedBox(
                              height: rheight(context) / 50,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: rwidth(context) / 2,
                                  child: Text(
                                    'Total Price',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyle.details.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  r'$7854.2',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.details.copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget rowItem(context, {required String title, required String text}) {
  return Row(
    children: [
      Container(
        width: rwidth(context) / 2,
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.details,
        ),
      ),
      Spacer(),
      Container(
        width: rwidth(context) / 2.95,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.details.copyWith(color: AppColors.black),
        ),
      ),
    ],
  );
}

Widget rowPaymentItem(context, {required String title, required String text}) {
  return Row(
    children: [
      Container(
        width: rwidth(context) / 2,
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.details,
        ),
      ),
      Spacer(),
      Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.details.copyWith(color: AppColors.black),
      ),
    ],
  );
}
