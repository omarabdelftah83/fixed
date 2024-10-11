import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/core/shimmer/shimmer_loading.dart';
import 'package:webbing_fixed/feature_admin/orders/controll/order_cubit.dart';
import 'package:webbing_fixed/feature_admin/orders/controll/order_state.dart';
import 'package:webbing_fixed/feature_admin/orders/widget/order_cared.dart';

class UpcomingOrdersTab extends StatelessWidget {
  const UpcomingOrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderCubit = context.read<OrderCubit>();
    orderCubit.getAllOrderAccept();

    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderLoading) {
          return ShimmerLoading();
        } else if (state is OrderLoadedAccept) {
          final upcomingOrders = state.getAllOrderAccept;
          if (upcomingOrders.isEmpty) {
            return const Center(child: Text('لا توجد طلبات قادمة'));
          }
          return ListView.builder(
            itemCount: upcomingOrders.length,
            itemBuilder: (context, index) {
              final order = upcomingOrders[index];
              return OrderCardAdmin(
                phoneNumber:'' ,
                email: '',
                id: order.orderDetails!.idOrder ,
                count: order.orderDetails?.count ?? 0,
                data: order.orderDetails?.time ?? 'ssssssss',
                imagePath: order.orderDetails?.file,
                location: order.orderDetails?.location ?? 'لا يوجد موقع',
                name: order.orderDetails?.user ?? 'لا يوجد اسم',
                service: order.orderDetails?.service ?? 'لا يوجد خدمة',
                status: 'القادم',
              );
            },
          );
        } else if (state is OrderErrorState) {
          return Center(child: Text('خطأ: ${state.errorMessage}'));
        } else {
          return const Center(child: Text('لا توجد طلبات قادمة'));
        }
      },
    );
  }
}
