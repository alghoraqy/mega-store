import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/modules/Home/Home%20Screens/cart/your_cart_screen.dart';
import 'package:mega_store/modules/Home/Home%20Screens/category/all_category_screen.dart';
import 'package:mega_store/modules/Home/Home%20Screens/product/search_screen.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/product_component.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

import '../../../shared/components/circle_category_comp.dart';
import '../../../shared/components/shared_component.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leadingWidth: 0,
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.only(left: rwidth(context) / 50),
              child: SizedBox(
                width: rwidth(context) / 1.45,
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  controller: cubit.searchController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      hintText: 'Search Product',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: AppColors.searchfieldColor),
                  onEditingComplete: () {
                    cubit
                        .searchProduct(cubit.searchController.text)
                        .then((value) {
                      navigatTo(context,
                          screen: BlocProvider.value(
                              value: AppCubit.get(context),
                              child: const SearchScreen()));
                    });
                  },
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: rwidth(context) / 20),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                        onPressed: () {
                          navigatTo(context,
                              screen: BlocProvider.value(
                                  value: AppCubit.get(context),
                                  child: const YourCartScreen()));
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 35,
                          color: Colors.black,
                        )),
                    CircleAvatar(
                      radius: rheight(context) / 70,
                      backgroundColor: Colors.white,
                      child: Container(
                        height: rheight(context) / 30,
                        width: rwidth(context) / 22,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: Center(
                          child: Text(
                            '${cubit.inCartList.length}',
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: rwidth(context) / 50,
                vertical: rheight(context) / 80),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: FadeInUp(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      carouselController: cubit.controller,
                      items: cubit.baners.map((e) {
                        return Container(
                            width: rwidth(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: ImageWithFadeIn(image: e));
                      }).toList(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: cubit.baners.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              cubit.controller.animateToPage(entry.key),
                          child: Container(
                            width: rwidth(context) / 43,
                            height: rheight(context) / 50,
                            margin: const EdgeInsets.only(
                                top: 8.0, left: 4.0, right: 4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(cubit.current == entry.key
                                        ? 0.9
                                        : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          navigatTo(context,
                              screen: BlocProvider.value(
                                value: AppCubit.get(context),
                                child: const AllCategoryScreen(),
                              ));
                        },
                        child: Text(
                          'All Categories >>',
                          style: TextStyle(color: AppColors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: rheight(context) / 5.4,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CircleCategoryComponent(
                              model: cubit.categories[index]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: rwidth(context) / 50,
                          );
                        },
                        itemCount: cubit.categories.length,
                      ),
                    ),
                    Container(
                      height: rheight(context) / 7,
                      width: rwidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: ImageWithFadeIn(image: cubit.baners[0]),
                    ),
                    SizedBox(
                      height: rheight(context) / 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: rwidth(context) / 90),
                      child: Text(
                        'Flash Sale',
                        style: AppTextStyle.sideTitle,
                      ),
                    ),
                    SizedBox(
                      height: rheight(context) / 100,
                    ),
                    SizedBox(
                      height: rheight(context) / 3,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ProductComponent(
                              model: cubit.products[index],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: rwidth(context) / 80,
                            );
                          },
                          itemCount: cubit.products.length),
                    ),
                    SizedBox(
                      height: rheight(context) / 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: rwidth(context) / 90),
                      child: Text(
                        'You May Like',
                        style: AppTextStyle.sideTitle
                            .copyWith(shadows: [], color: AppColors.black),
                      ),
                    ),
                    SizedBox(
                      height: rheight(context) / 100,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio:
                          rheight(context) / 2 / rwidth(context) / 1.55,
                      crossAxisSpacing: rheight(context) / 100,
                      children: List.generate(
                          cubit.products.length,
                          (index) => ProductComponent(
                                model: cubit.products[index],
                              )),
                    ),
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
