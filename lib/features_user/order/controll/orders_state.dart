
import 'package:webbing_fixed/features_user/order/%20model/get_all_order_accept.dart';
import 'package:webbing_fixed/features_user/order/%20model/get_all_order_cancel.dart';
import 'package:webbing_fixed/features_user/order/%20model/get_all_order_complete.dart';

abstract class OrdersUserState {}

class OrdersInitial extends OrdersUserState {}

class TabChangedState extends OrdersUserState {
  final int tabIndex;
  TabChangedState(this.tabIndex);
}
class OrderLoadingUser extends OrdersUserState {}
class OrderLoadedAcceptUser extends OrdersUserState {
  final List<GetAllOrderAcceptUser> getAllOrderAccept;
  OrderLoadedAcceptUser(this.getAllOrderAccept);

}
class OrderLoadedCancelUser extends OrdersUserState {
  final List<GetAllOrderCancelUser> getAllOrderCancel;
  OrderLoadedCancelUser(this.getAllOrderCancel);

}
class OrderLoadedCompleteUser extends OrdersUserState {
  final List<GetAllOrderCompleteUser> getAllOrderComplete;
  OrderLoadedCompleteUser(this.getAllOrderComplete);

}
class OrderErrorStateUser extends OrdersUserState {
  final String errorMessage;
  OrderErrorStateUser(this.errorMessage);
}