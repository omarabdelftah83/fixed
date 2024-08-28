import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/App_assets/app_assets.dart';
import 'package:webbing_fixed/features_user/order/widget/ordercard.dart';

class OrdersTab extends StatelessWidget {
  final String orderStatus;

  const OrdersTab({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrderCard(
          name: 'احمد السالم',
          service: 'تصليح مكيفات',
          date: 'اليوم - 6 مساء',
          imagePath: AppAssets.thePerson,
          status: orderStatus,
        ),
      ],
    );
  }
}
