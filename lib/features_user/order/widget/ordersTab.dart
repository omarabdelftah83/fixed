import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/App_assets/app_assets.dart';
import 'package:webbing_fixed/features_user/order/widget/accept_order_tab_user.dart';
import 'package:webbing_fixed/features_user/order/widget/cancel_order_tab_user.dart';
import 'package:webbing_fixed/features_user/order/widget/complete_order_tab_user.dart';
import 'package:webbing_fixed/features_user/order/widget/ordercard.dart';

class OrdersTab extends StatelessWidget {
  final String orderStatus;

  const OrdersTab({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    if (orderStatus == 'مكتملة') {
      return const CompletedOrdersTabUser();
    } else if (orderStatus == 'القادم') {
      return const AcceptOrdersTabUser();
    } else if (orderStatus == 'ملغية') {
      return const CanceledOrdersTabUser();
    } else {
      return const Center(child: Text('لا توجد بيانات'));
    }
  }
}
