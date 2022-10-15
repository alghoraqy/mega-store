import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/modules/Home/Home%20Screens/cart/ship_to_screen.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/cart_item.dart';
import 'package:mega_store/shared/components/my_button.dart';
import 'package:mega_store/shared/components/price_in_cart.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class YourCartScreen extends StatelessWidget {
  const YourCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: myAppbar(context, title: 'Your Cart', isBack: true),
          body: cubit.inCartList.isEmpty
              ? FadeInRight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/lottie/empty_cart.json'),
                      Center(
                        child: Text(
                          'There is no Product in Cart Yet!!',
                          style: AppTextStyle.appBar.copyWith(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                )
              : FadeInRight(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: rwidth(context) / 50,
                          vertical: rheight(context) / 50),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              height: rheight(context) / 2.5,
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return CartItem(
                                        model: cubit.inCartList[index]);
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                        height: rheight(context) / 90);
                                  },
                                  itemCount: cubit.inCartList.length),
                            ),
                            SizedBox(
                              height: rheight(context) / 40,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: AppColors.grey.withOpacity(.5)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: AppColors.grey.withOpacity(.5)),
                                  ),
                                  hintText: 'Enter Cupone code',
                                  suffixIcon: SizedBox(
                                    width: rwidth(context) / 4,
                                    child: MaterialButton(
                                      height: rheight(context) / 12,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      color: AppColors.brown,
                                      onPressed: () {},
                                      child: Text(
                                        'Apply',
                                        style: AppTextStyle.buttonText
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: rheight(context) / 60,
                            ),
                            PriceInCart(
                                itemsPrice: cubit.finalPrice,
                                shippingPrice: 40,
                                importChargesPrice: 50,
                                numOfItems: cubit.inCartList.length,
                                totalPrice: cubit.finalPrice + 90),
                            SizedBox(
                              height: rheight(context) / 50,
                            ),
                            MyButton(
                                height: rheight(context) / 12,
                                color: AppColors.brown,
                                child: Text(
                                  'Check out',
                                  style: AppTextStyle.buttonText,
                                ),
                                onPressed: () {
                                  navigatTo(context,
                                      screen: BlocProvider.value(
                                          value: AppCubit.get(context),
                                          child: const ShipToScreen()));
                                }),
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
