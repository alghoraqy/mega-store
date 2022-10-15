import 'package:flutter/material.dart';
import 'package:mega_store/shared/components/order_item.dart';
import 'package:mega_store/shared/components/shared_component.dart';
import 'package:mega_store/shared/responsive.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppbar(context, title: 'My Orders', isBack: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: rwidth(context) / 50, vertical: rheight(context) / 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyOrder(
                  title: 'sasda',
                  decription: 'asdsds : 15 August 2021',
                  orderStatus: 'Shipping',
                  numOfitems: 5,
                  price: 250),
              SizedBox(
                height: rheight(context) / 50,
              ),
              const MyOrder(
                  title: 'sdasxxxxxxxx',
                  decription: 'ddddddddd : 15 August 2520',
                  orderStatus: 'Shipping',
                  numOfitems: 5,
                  price: 300)
            ],
          ),
        ),
      ),
    );
  }
}
