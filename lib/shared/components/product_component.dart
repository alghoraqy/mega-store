import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/models/product_model.dart';
import 'package:mega_store/modules/Home/Home%20Screens/product/product_details_screen.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';
import 'package:mega_store/shared/shared_method.dart';

class ProductComponent extends StatelessWidget {
  final ProductModel model;
  const ProductComponent({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            navigatTo(context,
                screen: BlocProvider.value(
                    value: AppCubit.get(context),
                    child: ProductDetailsScreen(model: model)));
          },
          child: Ink(
            height: rheight(context) / 3.2,
            width: rwidth(context) / 2.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        height: rheight(context) / 5.3,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )),
                        clipBehavior: Clip.antiAlias,
                        child: ImageWithFadeIn(
                          image: model.image,
                        )),
                    IconButton(
                      onPressed: () {
                        AppCubit.get(context)
                            .changeFavourite(model.isFavourite, model);
                      },
                      icon: model.isFavourite
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 28,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 28,
                            ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: rheight(context) / 150,
                    ),
                    Text(
                      model.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.itemName,
                    ),
                    SizedBox(
                      height: rheight(context) / 150,
                    ),
                    Text(
                      r'$' '${model.price}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.itemName,
                    ),
                    SizedBox(
                      height: rheight(context) / 150,
                    ),
                    model.discount > 0
                        ? Row(
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
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
