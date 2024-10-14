import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/features_user/order/%20model/review_model_user.dart';
import 'package:webbing_fixed/features_user/order/data/cancel_order.dart';
import 'package:webbing_fixed/features_user/order/data/done_complete_order_user.dart';
import 'package:webbing_fixed/features_user/order/data/get_order_accept.dart';
import 'package:webbing_fixed/features_user/order/data/get_order_cancel.dart';
import 'package:webbing_fixed/features_user/order/data/get_order_complete.dart';
import 'package:webbing_fixed/features_user/order/data/review_data.dart';
import 'orders_state.dart';

class OrdersUserCubit extends Cubit<OrdersUserState> {
  final GetAllOrderCompleteUserRepository getAllOrderCompleteUserRepository;
  final GetAllOrderAcceptUserRepository getAllOrderAcceptUserRepository;
  final GetAllOrderCancelUserRepository getAllOrderCancelUserRepository;
  final ReviewService reviewService;
  final CancelOrderService cancelOrderService;
  final DoneCompeteOrderUser doneCompeteOrderUser;

  OrdersUserCubit(
      this.getAllOrderCompleteUserRepository,
      this.getAllOrderAcceptUserRepository,
      this.getAllOrderCancelUserRepository,
      this.reviewService,
      this.cancelOrderService,
      this.doneCompeteOrderUser)
      : super(OrdersInitial()) {}

  Future<void> doneOrderUser(BuildContext context, int id) async {
    try {
      emit(OrderLoadingUser());
      await doneCompeteOrderUser.doneOrderUser(id);
      await getAllOrderAcceptUser();
    } catch (e) {
      emit(OrderErrorStateUser('فشل في تحميل البيانات: '));
    }
  }


  Future<void> getAllOrderCompleteUser() async {
    try {
      emit(OrderLoadingUser());

      final getOrder = await getAllOrderCompleteUserRepository.getAllOrderCompleteUser();
      emit(OrderLoadedCompleteUser(getOrder));
    } catch (e) {
      emit(OrderErrorStateUser('Failed to load data: $e'));
    }
  }

  Future<void> getAllOrderAcceptUser() async {
    try {
      emit(OrderLoadingUser());
      final getOrder =
          await getAllOrderAcceptUserRepository.getAllOrderAcceptUser();
      emit(OrderLoadedAcceptUser(getOrder));
    } catch (e) {
      emit(OrderErrorStateUser('Failed to load data: $e'));
    }
  }

  Future<void> getAllOrderCancelUser() async {
    try {
      emit(OrderLoadingUser());
      final getOrder =
          await getAllOrderCancelUserRepository.getAllOrderCancelUser();
      emit(OrderLoadedCancelUser(getOrder));
    } catch (e) {
      emit(OrderErrorStateUser('Failed to load data: $e'));
    }
  }

  Future<void> cancelOrder(int id) async {
    try {
      emit(OrderLoadingUser());
      final getOrder = await cancelOrderService.cancelOrder(id);
      emit(CancelOrderLoaded(getOrder));
    } catch (e) {
      emit(OrderErrorStateUser('Failed to load data: $e'));
    }
  }

  Future<void> reviewServices(int rate, int id) async {
    try {
      emit(OrderLoadingUser());

      final servicesRequest = ReviewRequest(rating: rate);

      final service = await reviewService.reviewService(servicesRequest, id);

      service.fold((failure) {
        emit(OrderErrorStateUser(failure.message));
      }, (reviewResponse) {
        // Handle the success case and emit the loaded state
        emit(ServiceIdLoaded(reviewResponse));
      });
    } catch (e) {
      print('Error in fetchServiceId: $e');
      emit(OrderErrorStateUser(e.toString()));
    }
  }
  void showSnackbar(BuildContext context, String message, Color? color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
