import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/models/category_model.dart';
import 'package:mega_store/modules/Home/Home%20Screens/category/category_screen.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class CircleCategoryComponent extends StatelessWidget {
  final CategoryModel model;

  const CircleCategoryComponent({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          highlightColor: Colors.grey.withOpacity(.1),
          hoverColor: Colors.grey.withOpacity(.5),
          onTap: () {
            navigatTo(context,
                screen: BlocProvider.value(
                    value: AppCubit.get(context),
                    child: CategoryScreen(model: model)));
          },
          child: Ink(
            child: Column(
              children: [
                Container(
                    height: rheight(context) / 7.9,
                    width: rwidth(context) / 3.4,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    clipBehavior: Clip.antiAlias,
                    child: ImageWithFadeIn(image: model.image)),
                SizedBox(
                  height: rheight(context) / 120,
                ),
                SizedBox(
                  width: rwidth(context) / 4,
                  child: Text(
                    model.categoryName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.categoryStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
