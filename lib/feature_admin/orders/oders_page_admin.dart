
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/widget/custom_appar.dart';
import 'package:webbing_fixed/feature_admin/orders/widget/order_tab_admin.dart';
import '../../core/app_text/AppText.dart';

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
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            labelStyle:const TextStyle(fontSize:20 ) ,
            controller: _tabController,
            tabs: const [

              Tab(text: 'ملغية',),
              Tab(text: 'مكتملة'),
              Tab(text: 'القادم'),

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

