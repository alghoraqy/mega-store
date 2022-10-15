import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lottie/lottie.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/product_component.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: myAppbar(context, title: 'Favourite List', isBack: false),
            body: AnimationLimiter(
              child: cubit.favouriteList.isEmpty
                  ? FadeInRight(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/lottie/empty_favourite.json'),
                            Text(
                              'There is no favourite yet!!',
                              style: AppTextStyle.appBar.copyWith(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    )
                  // Center(
                  //     child: Padding(
                  //       padding: EdgeInsets.symmetric(
                  //           horizontal: rwidth(context) / 40),
                  //       child:
                  // Text(
                  //         'There is no favourite yet!!',
                  //         style: AppTextStyle.appBar.copyWith(fontSize: 22),
                  //       ),
                  //     ),
                  //   )
                  : GridView.count(
                      padding: EdgeInsets.symmetric(
                          horizontal: rwidth(context) / 50,
                          vertical: rheight(context) / 50),
                      crossAxisCount: 2,
                      physics: const BouncingScrollPhysics(),
                      mainAxisSpacing: rheight(context) / 50,
                      crossAxisSpacing: rwidth(context) / 50,
                      childAspectRatio: rheight(context) / 1200,
                      children: List.generate(
                        cubit.favouriteList.length,
                        (int index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 400),
                            columnCount: 2,
                            child: SlideAnimation(
                              child: FadeInAnimation(
                                duration: const Duration(milliseconds: 800),
                                child: ProductComponent(
                                  model: cubit.favouriteList[index],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ));
      },
    );
  }
}
