import 'package:flutter/cupertino.dart';
import 'package:mega_store/models/product_model.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';

class ReviewComponent extends StatelessWidget {
  final Review review;
  const ReviewComponent({super.key, required this.review});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: rheight(context) / 10,
              width: rwidth(context) / 4,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias,
              child: ImageWithFadeIn(image: review.image),
            ),
            SizedBox(
              width: rwidth(context) / 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.name,
                  style: AppTextStyle.itemName.copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: rheight(context) / 100,
                ),
                RateComponent(rate: review.rate, size: rheight(context) / 32)
              ],
            ),
          ],
        ),
        SizedBox(
          height: rheight(context) / 50,
        ),
        Text(
          review.review,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.details,
        ),
        SizedBox(
          height: rheight(context) / 80,
        ),
        Text(
          review.date,
          style: AppTextStyle.details,
        ),
      ],
    );
  }
}
