import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mega_store/shared/app_textstyle.dart';
import 'package:mega_store/shared/components/shared_component.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppbar(context, title: 'Offers', isBack: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/empty_favourite.json'),
            Text(
              'There is no Offers yet!!',
              style: AppTextStyle.appBar.copyWith(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
