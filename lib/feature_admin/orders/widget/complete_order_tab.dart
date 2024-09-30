import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/feature_admin/orders/controll/order_cubit.dart';
import 'package:webbing_fixed/feature_admin/orders/controll/order_state.dart';
import 'package:webbing_fixed/feature_admin/orders/widget/order_cared.dart';
import 'package:intl/intl.dart'; // Add this import

class CompletedOrdersTab extends StatelessWidget {
  const CompletedOrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderCubit = context.read<OrderCubit>();
    orderCubit.getAllOrderComplete();

    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OrderLoadedComplete) {
          final orders = state.getAllOrderComplete;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];

              // Format the DateTime to a string
              String? formattedDate;
              if (order.createdAt != null) {
                formattedDate =
                    DateFormat('yyyy-MM-dd').format(order.createdAt!);
              }

              return OrderCardAdmin(
                dataTime: formattedDate,
                // Pass the formatted date here
                imagePath: order.image,
                price: order.price,
                location: order.location ?? 'لا يوجد موقع',
                name: order.name ?? 'لا يوجد اسم',
                service: order.service ?? 'لا يوجد خدمة',
                status: 'مكتملة',
              );
            },
          );
        } else if (state is OrderErrorState) {
          return Center(child: Text('خطأ: ${state.errorMessage}'));
        } else {
          return const Center(child: Text('لا توجد طلبات مكتملة'));
        }
      },
    );
  }
}
