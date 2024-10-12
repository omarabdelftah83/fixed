
import 'package:webbing_fixed/feature_admin/orders/model/gell_all_order_complate.dart';
import 'package:webbing_fixed/feature_admin/orders/model/get_all_order_accept.dart';
import 'package:webbing_fixed/feature_admin/orders/model/get_all_order_cancel.dart';
import 'package:webbing_fixed/feature_admin/orders/model/review_admin.dart';
import 'package:webbing_fixed/features_user/order/%20model/cancel_order.dart';

abstract class OrderState {}
final class OrderInitial extends OrderState {}
class OrderLoading extends OrderState {}
class OrderLoadedComplete extends OrderState {
  final List<GetAllOrderComplete> getAllOrderComplete;
  OrderLoadedComplete(this.getAllOrderComplete);

}
class CancelOrderAdminLoaded extends OrderState {
  final CancelOfferResponse cancelOfferResponse;
  CancelOrderAdminLoaded(this.cancelOfferResponse);

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
class ServiceAdminLoaded extends OrderState {
  final ReviewAdminResponse reviewResponse;

  ServiceAdminLoaded(this.reviewResponse);

  @override
  List<Object?> get props => [reviewResponse];
}
class OrderSuccessState extends OrderState {
  final String message;
  OrderSuccessState(this.message);
}