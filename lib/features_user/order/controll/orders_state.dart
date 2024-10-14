
import 'package:webbing_fixed/feature_admin/home/model/done_model.dart';
import 'package:webbing_fixed/features_user/order/%20model/cancel_order.dart';
import 'package:webbing_fixed/features_user/order/%20model/get_all_order_accept.dart';
import 'package:webbing_fixed/features_user/order/%20model/get_all_order_cancel.dart';
import 'package:webbing_fixed/features_user/order/%20model/get_all_order_complete.dart';
import 'package:webbing_fixed/features_user/order/%20model/review_model_user.dart';

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
class CancelOrderLoaded extends OrdersUserState {
  final CancelOfferResponse cancelOfferResponse;
  CancelOrderLoaded(this.cancelOfferResponse);
}
class ResponseMessageLoaded extends OrdersUserState {
  final ResponseMessage Message;
  ResponseMessageLoaded(this.Message);
}


class OrderErrorStateUser extends OrdersUserState {
  final String errorMessage;
  OrderErrorStateUser(this.errorMessage);
}
class ServiceIdLoaded extends OrdersUserState {
  final ReviewResponse reviewResponse;

  ServiceIdLoaded(this.reviewResponse);

  @override
  List<Object?> get props => [reviewResponse];
}
