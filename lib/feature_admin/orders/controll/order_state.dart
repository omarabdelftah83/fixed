
import 'package:webbing_fixed/feature_admin/orders/model/gell_all_order_complate.dart';
import 'package:webbing_fixed/feature_admin/orders/model/get_all_order_accept.dart';
import 'package:webbing_fixed/feature_admin/orders/model/get_all_order_cancel.dart';

abstract class OrderState {}
final class OrderInitial extends OrderState {}
class OrderLoading extends OrderState {}
class OrderLoadedComplete extends OrderState {
  final List<GetAllOrderComplete> getAllOrderComplete;
  OrderLoadedComplete(this.getAllOrderComplete);

}

class OrderLoadedAccept extends OrderState {
  final List<GetAllOrderAccept> getAllOrderAccept;
  OrderLoadedAccept(this.getAllOrderAccept);

}
class OrderLoadedCancel extends OrderState {
  final List<GetAllOrderCancel> getAllOrderCancel;
  OrderLoadedCancel(this.getAllOrderCancel);

}
class OrderErrorState extends OrderState {
  final String errorMessage;
  OrderErrorState(this.errorMessage);
}