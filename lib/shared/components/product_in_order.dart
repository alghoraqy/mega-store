import 'package:flutter/material.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';

class ProductInOrder extends StatelessWidget {
  const ProductInOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: rheight(context) / 6,
      width: rwidth(context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: .7, color: AppColors.grey.withOpacity(.5))),
      child: Row(
        children: [
          Container(
            height: rheight(context) / 7,
            width: rwidth(context) / 4,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            clipBehavior: Clip.antiAlias,
            child: const ImageWithFadeIn(
                image:
                    'http://images4.fanpop.com/image/photos/19400000/rainbow-sky-beautiful-pictures-19401741-1093-614.jpg'),
          ),
          SizedBox(
            width: rwidth(context) / 50,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nike Air Zoom Pegasus 36 Miami',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.appBar.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: rheight(context) / 20,
                ),
                Text(
                  r'$250',
                  style: AppTextStyle.appBar.copyWith(fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
