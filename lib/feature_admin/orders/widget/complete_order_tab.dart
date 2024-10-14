import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/feature_admin/orders/controll/order_cubit.dart';
import 'package:webbing_fixed/feature_admin/orders/controll/order_state.dart';
import 'package:webbing_fixed/feature_admin/orders/widget/order_cared.dart';
import 'package:intl/intl.dart';

import '../../../core/shimmer/shimmer_loading.dart'; // Add this import

class CompletedOrdersTab extends StatelessWidget {
  const CompletedOrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderCubit = context.read<OrderCubit>();
    orderCubit.getAllOrderComplete();

    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return ShimmerLoading();
        } else if (state is OrderLoadedComplete) {
          final orders = state.getAllOrderComplete;
          if (orders.isEmpty) {
            return const Center(child: Text('لا توجد طلبات مكتمله'));
          }
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];

              String? formattedDate;
              if (order.createdAt != null) {
                formattedDate =
                    DateFormat('yyyy-MM-dd').format(order.createdAt!);
              }

              return OrderCardAdmin(
                dataTime: formattedDate,
                 idUser: order.user,
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
