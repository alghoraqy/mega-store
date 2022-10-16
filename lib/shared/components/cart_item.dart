import 'package:flutter/material.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/models/product_model.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/hex_colors.dart';
import 'package:mega_store/shared/responsive.dart';

class CartItem extends StatelessWidget {
  final ProductModel model;
  const CartItem({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: rheight(context) / 6,
      width: rwidth(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.grey.withOpacity(.5))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: rwidth(context) / 80),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                height: rheight(context) / 8,
                width: rwidth(context) / 3.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                clipBehavior: Clip.antiAlias,
                child: ImageWithFadeIn(image: model.image),
              ),
              SizedBox(
                width: rwidth(context) / 60,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: rwidth(context) / 2.2,
                        child: Text(
                          model.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.appBar.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: rwidth(context) / 50,
                      ),
                      InkWell(
                        onTap: () {
                          AppCubit.get(context)
                              .changeFavourite(model.isFavourite, model);
                        },
                        child: model.isFavourite
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 30,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                                color: Colors.grey,
                                size: 30,
                              ),
                      ),
                      SizedBox(
                        width: rwidth(context) / 80,
                      ),
                      InkWell(
                        onTap: () {
                          AppCubit.get(context)
                              .removeFromCart(model.inCart, model);
                        },
                        child: const Icon(
                          Icons.delete_outline,
                          color: Colors.grey,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: rheight(context) / 40,
                  ),
                  Row(
                    children: [
                      Text(
                        r'$' '${model.price}',
                        style: AppTextStyle.appBar
                            .copyWith(fontSize: 15, color: HexColor('#40BFFF')),
                      ),
                      SizedBox(
                        width: rwidth(context) / 3.8,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              AppCubit.get(context).changequantity(false, model);
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 30,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: rwidth(context) / 50),
                            height: rheight(context) / 30,
                            width: rwidth(context) / 15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.grey.withOpacity(.5)),
                            child: Center(child: Text('${model.quantity}')),
                          ),
                          InkWell(
                            onTap: () {
                              AppCubit.get(context).changequantity(true, model);
                            },
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
