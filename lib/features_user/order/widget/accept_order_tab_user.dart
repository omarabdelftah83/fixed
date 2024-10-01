import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/features_user/order/controll/orders_cubit.dart';
import 'package:webbing_fixed/features_user/order/controll/orders_state.dart';
import 'package:webbing_fixed/features_user/order/widget/ordercard.dart';

class AcceptOrdersTabUser extends StatelessWidget {
  const AcceptOrdersTabUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderCubit = context.read<OrdersUserCubit>();
    orderCubit.getAllOrderAcceptUser();

    return BlocBuilder<OrdersUserCubit, OrdersUserState>(
      builder: (context, state) {
        if (state is OrderLoadingUser) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OrderLoadedAcceptUser) {
          final canceledOrders = state.getAllOrderAccept;
          if (canceledOrders.isEmpty) {
            return const Center(child: Text('لا توجد طلبات ملغية'));
          }
          return ListView.builder(
            itemCount: canceledOrders.length,
            itemBuilder: (context, index) {
              final order = canceledOrders[index];
              return OrderCard(

                name: order.providerName ?? 'لا يوجد اسم',
              service: order.serviceName,
                status: 'القادم',
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
