import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/widget/custom_appar.dart';
import 'package:webbing_fixed/features_user/order/widget/ordersTab.dart';
import '../../core/app_text/AppText.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: Column(
        children: [
          Center(
            child: CustomText(
              text: 'appbareOrderString1'.tr(),  // تم استخدام الترجمة هنا
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            labelStyle: const TextStyle(fontSize: 20),
            controller: _tabController,
            tabs: [
              Tab(text: 'cancelled_orders1'.tr()),  // الترجمة هنا
              Tab(text: 'completed_orders1'.tr()),  // الترجمة هنا
              Tab(text: 'upcoming_orders1'.tr()),  // الترجمة هنا
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                OrdersTab(orderStatus: 'ملغية'),
                OrdersTab(orderStatus: 'مكتملة'),
                OrdersTab(orderStatus: 'القادم'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
