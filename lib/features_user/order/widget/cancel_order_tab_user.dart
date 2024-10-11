import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/core/shimmer/shimmer_loading.dart';
import 'package:webbing_fixed/features_user/order/controll/orders_cubit.dart';
import 'package:webbing_fixed/features_user/order/controll/orders_state.dart';
import 'package:webbing_fixed/features_user/order/widget/ordercard.dart';

class CanceledOrdersTabUser extends StatelessWidget {
  const CanceledOrdersTabUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderCubit = context.read<OrdersUserCubit>();
    orderCubit.getAllOrderCancelUser();

    return BlocBuilder<OrdersUserCubit, OrdersUserState>(
      builder: (context, state) {
        if (state is OrderLoadingUser) {
          return ShimmerLoading();
        } else if (state is OrderLoadedCancelUser) {
          final canceledOrders = state.getAllOrderCancel;
          if (canceledOrders.isEmpty) {
            return const Center(child: Text('لا توجد طلبات ملغية'));
          }
          return ListView.builder(
            itemCount: canceledOrders.length,
            itemBuilder: (context, index) {
              final order = canceledOrders[index];
              return OrderCard(
                imagePath: order.providerPic,
                idProvider: order.idProvider, // Pass idProvider here
                name: order.providerName ?? 'لا يوجد اسم',
                service: order.serviceName,
                //  service: order.orderDetails?.service ?? 'لا يوجد خدمة',
                status: 'ملغية',
              );
            },
          );
        } else if (state is OrderErrorStateUser) {
          return Center(child: Text('خطأ: ${state.errorMessage}'));
        } else {
          return const Center(child: Text('لا توجد طلبات ملغية'));
        }
      },
    );
  }
}
