import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/feature_admin/orders/controll/order_cubit.dart';
import 'package:webbing_fixed/feature_admin/orders/controll/order_state.dart';
import 'package:webbing_fixed/feature_admin/orders/widget/order_cared.dart';
import 'package:webbing_fixed/feature_admin/orders/widget/order_tab_admin.dart';

class CanceledOrdersTab extends StatelessWidget {
  const CanceledOrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderCubit = context.read<OrderCubit>();
    orderCubit.getAllOrderCancel();

    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OrderLoadedCancel) {
          final canceledOrders = state.getAllOrderCancel;
          if (canceledOrders.isEmpty) {
            return const Center(child: Text('لا توجد طلبات ملغية'));
          }
          return ListView.builder(
            itemCount: canceledOrders.length,
            itemBuilder: (context, index) {
              final order = canceledOrders[index];
              return OrderCardAdmin(
                data:order.orderDetails.time,
                imagePath: order.orderDetails?.file,
                location: order.orderDetails?.location ?? 'لا يوجد موقع',
                name: order.orderDetails?.user ?? 'لا يوجد اسم',
                service: order.orderDetails?.service ?? 'لا يوجد خدمة',
                status: 'ملغية',
              );
            },
          );
        } else if (state is OrderErrorState) {
          return Center(child: Text('خطأ: ${state.errorMessage}'));
        } else {
          return const Center(child: Text('لا توجد طلبات ملغية'));
        }
      },
    );
  }
}
