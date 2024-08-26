import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/widget/custom_appar.dart';
import 'package:webbing_fixed/features/order/widget/ordersTab.dart';
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
          const Center(
            child: CustomText(
              text: 'الطلبيات',
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          TabBar(
            labelStyle:const TextStyle(fontSize:20 ) ,
            controller: _tabController,
            tabs: const [
              Tab(text: 'القادم',),
              Tab(text: 'مكتملة'),
              Tab(text: 'ملغية'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                OrdersTab(orderStatus: 'القادم'),
                OrdersTab(orderStatus: 'مكتملة'),
                OrdersTab(orderStatus: 'ملغية'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

