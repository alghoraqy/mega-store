import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/models/product_model.dart';
import 'package:mega_store/modules/Home/Home%20Screens/product/reviews_screen.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/product_component.dart';
import 'package:mega_store/shared/components/review_component.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel model;
  const ProductDetailsScreen({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: myAppbar(context, title: model.name, isBack: true),
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
                  cubit.addtoCart(model.inCart, model).then((value) {
                    cubit.getFinalPrice(model);
                  });
                },
                label: Text(
                  'Add To Cart',
                  style: AppTextStyle.buttonText,
                )),
          ),
          body: FadeInUp(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: rwidth(context) / 40,
                  vertical: rheight(context) / 80),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: cubit.controller,
                      items: model.imageList
                          .map((e) => Container(
                              width: rwidth(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: ImageWithFadeIn(image: e)))
                          .toList(),
                      options: CarouselOptions(
                          autoPlayInterval: const Duration(seconds: 4),
                          height: MediaQuery.of(context).size.height / 5,
                          autoPlay: true,
                          autoPlayCurve: Curves.bounceOut,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            cubit.changeIndicator(index);
                          }),
                    ),
                    CarousalDots(modelList: model.imageList),
                    SizedBox(
                      height: rheight(context) / 80,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: rwidth(context) / 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: rwidth(context) / 1.3,
                                child: Text(
                                  model.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyle.appBar,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    cubit.changeFavourite(
                                        model.isFavourite, model);
                                  },
                                  icon: model.isFavourite
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 35,
                                        )
                                      : Icon(
                                          Icons.favorite_outline,
                                          color: AppColors.grey,
                                          size: 35,
                                        )),
                            ],
                          ),
                          RateComponent(
                              rate: model.rate.toDouble(),
                              size: rheight(context) / 32),
                          SizedBox(
                            height: rheight(context) / 50,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: rwidth(context) / 80),
                            child: Row(
                              children: [
                                Text(
                                  r'$' '${model.price}',
                                  style: AppTextStyle.appBar,
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      r'$' '${model.oldPrice}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.discount,
                                    ),
                                    SizedBox(
                                      width: rwidth(context) / 40,
                                    ),
                                    Text(
                                      '${model.discount}% off',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyle.discount.copyWith(
                                          color: AppColors.buttonColor,
                                          fontWeight: FontWeight.w600,
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: rheight(context) / 50,
                          ),
                          Text(
                            'Details',
                            style: AppTextStyle.sideTitle.copyWith(shadows: []),
                          ),
                          SizedBox(
                            height: rheight(context) / 80,
                          ),
                          Text(
                            model.details,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.details,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Review Product',
                                style: AppTextStyle.appBar,
                              ),
                              TextButton(
                                onPressed: () {
                                  navigatTo(context,
                                      screen: BlocProvider.value(
                                          value: AppCubit.get(context),
                                          child: ReviewsScreen(
                                              model: model.review)));
                                },
                                child: Text(
                                  'See more>',
                                  style: AppTextStyle.greyBold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              RateComponent(
                                  rate: model.rate.toDouble(),
                                  size: rheight(context) / 32),
                              SizedBox(
                                width: rwidth(context) / 50,
                              ),
                              Text(
                                '${model.rate}',
                                style: AppTextStyle.discount.copyWith(
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              SizedBox(
                                width: rwidth(context) / 90,
                              ),
                              Text(
                                '(${model.review.length} review)',
                                style: AppTextStyle.discount.copyWith(
                                  fontSize: 16,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: rheight(context) / 80,
                          ),
                          ReviewComponent(review: model.review[0]),
                          SizedBox(
                            height: rheight(context) / 50,
                          ),
                          Text('You Might Also Like',
                              style: AppTextStyle.sideTitle.copyWith(
                                shadows: [],
                                color: AppColors.black,
                              )),
                          SizedBox(
                            height: rheight(context) / 80,
                          ),
                          SizedBox(
                            height: rheight(context) / 3,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ProductComponent(
                                  model: cubit.products[index],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: rwidth(context) / 50,
                                );
                              },
                              itemCount: cubit.products.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: rheight(context) / 12,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
