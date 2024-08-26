
abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class TabChangedState extends OrdersState {
  final int tabIndex;
  TabChangedState(this.tabIndex);
}