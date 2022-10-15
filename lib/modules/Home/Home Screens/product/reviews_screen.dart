// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/models/product_model.dart';
import 'package:mega_store/modules/Home/Home%20Screens/product/write_review_screen.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/review_component.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class ReviewsScreen extends StatelessWidget {
  List<Review> model;
  ReviewsScreen({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
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
                          child: const WriteReviewScreen()));
                },
                label: Text(
                  'Write Review',
                  style: AppTextStyle.buttonText,
                )),
          ),
          backgroundColor: Colors.white,
          appBar:
              myAppbar(context, title: '${model.length} Review', isBack: true),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: rheight(context) / 1.1,
                  child: AnimationLimiter(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: rwidth(context) / 30,
                          vertical: rheight(context) / 50),
                      itemCount: model.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: rheight(context) / 70,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 600),
                          child: SlideAnimation(
                            child: FadeInAnimation(
                              child: ReviewComponent(review: model[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: rheight(context) / 10,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
