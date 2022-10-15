import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/modules/Home/Home%20Screens/profile/add_address_screen.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/components/ship_to_item.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: myAppbar(
            context,
            title: 'Address',
            isBack: true,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: SizedBox(
            width: rwidth(context) / 1.12,
            height: rheight(context) / 14,
            child: FloatingActionButton.extended(
                backgroundColor: AppColors.brown,
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  navigatTo(context,
                      screen: BlocProvider.value(
                          value: AppCubit.get(context),
                          child: const AddAddressScreen()));
                },
                label: Text(
                  'add address',
                  style: AppTextStyle.buttonText,
                )),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: rwidth(context) / 50,
                vertical: rheight(context) / 50),
            child: Column(
              children: [
                AnimationLimiter(
                  child: SizedBox(
                    height: rheight(context) / 1.3,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: cubit.addresses.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: rheight(context) / 50,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: ShipToItem(
                                model: cubit.addresses[index],
                                index: index,
                                onpressed: () {
                                  cubit.changeShipTocurrenIndex(index);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: rheight(context) / 50,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
