import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'order_export.dart';

class OrdersPageAdmin extends StatefulWidget {
  const OrdersPageAdmin({super.key});

  @override
  _OrdersPageAdminState createState() => _OrdersPageAdminState();
}

class _OrdersPageAdminState extends State<OrdersPageAdmin>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
      }
    });
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
              text: 'Orders'.tr(),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            labelStyle:const TextStyle(fontSize:20 ) ,
            controller: _tabController,
            tabs:  [
              Tab(text: 'cancelled_orders1'.tr()),  // الترجمة هنا
              Tab(text: 'completed_orders1'.tr()),  // الترجمة هنا
              Tab(text: 'upcoming_orders1'.tr()),  // الترجمة هنا
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:  const [
                OrdersTabAdmin(orderStatus: 'ملغية'),
                OrdersTabAdmin(orderStatus: 'مكتملة'),
                OrdersTabAdmin(orderStatus: 'القادم'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
