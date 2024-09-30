import 'package:flutter/material.dart';
import 'package:webbing_fixed/feature_admin/orders/order_export.dart';

class OrdersTabAdmin extends StatelessWidget {
  final String orderStatus;

  const OrdersTabAdmin({super.key, required this.orderStatus});

  @override
  Widget build(BuildContext context) {
    if (orderStatus == 'مكتملة') {
      return const CompletedOrdersTab();
    } else if (orderStatus == 'القادم') {
      return const UpcomingOrdersTab();
    } else if (orderStatus == 'ملغية') {
      return const CanceledOrdersTab();
    } else {
      return const Center(child: Text('لا توجد بيانات'));
    }
  }
}


