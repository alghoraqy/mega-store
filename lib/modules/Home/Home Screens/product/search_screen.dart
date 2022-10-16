import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/modules/Home/Home%20Layout/home_layout.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/assets_manager.dart';
import 'package:mega_store/shared/components/my_button.dart';
import 'package:mega_store/shared/components/product_component.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: myAppbar(context, title: 'Search Results', isBack: false),
          body: cubit.searchedProducts.isEmpty
              ? _notFoundSearchScreen(context)
              : _foundSearchScreen(context, cubit.searchedProducts),
        );
      },
    );
  }
}

Widget _notFoundSearchScreen(context) {
  return Padding(
    padding: EdgeInsets.only(
      top: rheight(context) / 10,
      left: rwidth(context) / 40,
      right: rwidth(context) / 40,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: const AssetImage(ImgAsset.search),
          height: rheight(context) / 4,
          fit: BoxFit.cover,
        ),
        Text(
          'No Result Found',
          style: AppTextStyle.appBar.copyWith(fontSize: 22),
        ),
        SizedBox(
          height: rheight(context) / 40,
        ),
        MyButton(
          onPressed: () {
            navigatAndReplacement(context, screen: const HomeLayout());
          },
          color: AppColors.brown,
          child: Text(
            'Back to Home',
            style: AppTextStyle.buttonText,
          ),
        ),
      ],
    ),
  );
}

Widget _foundSearchScreen(context, List list) {
  return AnimationLimiter(
    child: GridView.count(
      padding: EdgeInsets.symmetric(
          horizontal: rwidth(context) / 50, vertical: rheight(context) / 50),
      crossAxisCount: 2,
      physics: const BouncingScrollPhysics(),
      mainAxisSpacing: rheight(context) / 50,
      crossAxisSpacing: rwidth(context) / 50,
      childAspectRatio: .7,
      children: List.generate(
        list.length,
        (int index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 400),
            columnCount: 2,
            child: SlideAnimation(
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 800),
                child: ProductComponent(
                  model: list[index],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
