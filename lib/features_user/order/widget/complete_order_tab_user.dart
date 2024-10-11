import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/core/shimmer/shimmer_loading.dart';
import 'package:webbing_fixed/features_user/order/controll/orders_cubit.dart';
import 'package:webbing_fixed/features_user/order/controll/orders_state.dart';
import 'package:webbing_fixed/features_user/order/widget/ordercard.dart';

class CompletedOrdersTabUser extends StatelessWidget {
  const CompletedOrdersTabUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderCubit = context.read<OrdersUserCubit>();
    orderCubit.getAllOrderCompleteUser();

    return BlocBuilder<OrdersUserCubit, OrdersUserState>(
      builder: (context, state) {
        if (state is OrderLoadingUser) {
          return const ShimmerLoading();
        } else if (state is OrderLoadedCompleteUser) {
          final canceledOrders = state.getAllOrderComplete;
          if (canceledOrders.isEmpty) {
            return const Center(child: Text('لا توجد طلبات ملغية'));
          }
          return ListView.builder(
            itemCount: canceledOrders.length,
            itemBuilder: (context, index) {
              final order = canceledOrders[index];
              String? formattedDate;
              if (order.createdAt != null) {
                formattedDate = DateFormat('yyyy-MM-dd').format(order.createdAt!);
              }
              return OrderCard(
               // idProvider: order.idProvider, // Pass idProvider here
                imagePath: order.image,
                name: order.name,
                service: order.service,
                date: formattedDate, // Use the local formattedDate variable
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
