import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  late TabController tabController;

  OrdersCubit(TickerProvider tickerProvider) : super(OrdersInitial()) {
    tabController = TabController(length: 3, vsync: tickerProvider);
  }

  void changeTab(int index) {
    tabController.index = index;
    emit(TabChangedState(index));
  }

  @override
  Future<void> close() {
    tabController.dispose();
    return super.close();
  }
}
