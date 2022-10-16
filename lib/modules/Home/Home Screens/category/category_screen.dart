import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/models/category_model.dart';
import 'package:mega_store/shared/components/product_component.dart';
import 'package:mega_store/shared/components/shared_component.dart';

import '../../../../shared/responsive.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryModel model;
  const CategoryScreen({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: myAppbar(context, title: model.categoryName, isBack: true),
          body: AnimationLimiter(
            child: GridView.count(
              padding: EdgeInsets.symmetric(
                  horizontal: rwidth(context) / 50,
                  vertical: rheight(context) / 50),
              crossAxisCount: 2,
              physics: const BouncingScrollPhysics(),
              mainAxisSpacing: rheight(context) / 50,
              crossAxisSpacing: rwidth(context) / 50,
              childAspectRatio: .7,
              children: List.generate(
                cubit.products.length,
                (int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 400),
                    columnCount: 3,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: ProductComponent(model: cubit.products[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
