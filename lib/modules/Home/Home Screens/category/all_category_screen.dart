import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/bloc/App%20Bloc/app_states.dart';
import 'package:mega_store/shared/components/circle_category_comp.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: myAppbar(title: 'All Categories', isBack: true, context),
          body: AnimationLimiter(
            child: GridView.count(
              crossAxisCount: 3,
              physics: const BouncingScrollPhysics(),
              mainAxisSpacing: rheight(context) / 100,
              childAspectRatio: rheight(context) / 1000,
              children: List.generate(
                cubit.categories.length,
                (int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 400),
                    columnCount: 3,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: CircleCategoryComponent(
                            model: cubit.categories[index]),
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
