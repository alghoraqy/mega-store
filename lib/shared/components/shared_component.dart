import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mega_store/bloc/App%20Bloc/app_cubit.dart';
import 'package:mega_store/shared/app_colors.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/assets_manager.dart';
import 'package:mega_store/shared/responsive.dart';

class LogoWithText extends StatelessWidget {
  final String firstText;
  final String secondText;
  const LogoWithText({
    super.key,
    required this.firstText,
    required this.secondText,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: rwidth(context) / 15),
              child: Image(
                image: const AssetImage(ImgAsset.logo),
                height: rwidth(context) / 4,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        SizedBox(
          height: rheight(context) / 30,
        ),
        Text(
          firstText,
          style: AppTextStyle.loginHead1,
        ),
        SizedBox(
          height: rheight(context) / 80,
        ),
        Text(
          secondText,
          style: AppTextStyle.loginHead2,
        ),
      ],
    );
  }
}

class ImageWithFadeIn extends StatelessWidget {
  final String image;
  const ImageWithFadeIn({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage(ImgAsset.loading),
      image: NetworkImage(image),
      fit: BoxFit.cover,
      placeholderFit: BoxFit.cover,
    );
  }
}

class CarousalDots extends StatelessWidget {
  final List modelList;
  const CarousalDots({super.key, required this.modelList});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: modelList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () =>
              AppCubit.get(context).controller.animateToPage(entry.key),
          child: Container(
            width: rwidth(context) / 43,
            height: rheight(context) / 45,
            margin: EdgeInsets.only(
                top: rheight(context) / 100,
                left: rwidth(context) / 100,
                right: rwidth(context) / 100),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                    .withOpacity(AppCubit.get(context).current == entry.key
                        ? 0.9
                        : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}

PreferredSizeWidget myAppbar(
  context, {
  required String title,
  required bool isBack,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: isBack ? false : true,
    actions: actions,
    leading: isBack
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: AppColors.black,
            ))
        : const SizedBox(),
    title: Text(
      title,
      style: AppTextStyle.appBar,
    ),
  );
}

class RateComponent extends StatelessWidget {
  final double rate;
  final double size;
  const RateComponent({super.key, required this.rate, required this.size});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rate,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: size,
      direction: Axis.horizontal,
    );
  }
}

class MyDashedSeparator extends StatelessWidget {
  const MyDashedSeparator(
      {Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class ButtomSheetForm extends StatelessWidget {
  final String title;
  final String hint;
  double? fontSize;

  ButtomSheetForm(
      {super.key, required this.title, required this.hint, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.appBar.copyWith(fontSize: fontSize),
        ),
        SizedBox(
          height: rheight(context) / 70,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.grey.withOpacity(.5))),
          ),
        )
      ],
    );
  }
}

Future<bool?> showToast({required String text, required Color color}) async {
  await Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
  return null;
}

Future myBottomSheet(
  context, {
  required Widget child,
  bool? isControlled,
}) {
  return showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: isControlled ?? false,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: child,
          ),
        );
      });
}
