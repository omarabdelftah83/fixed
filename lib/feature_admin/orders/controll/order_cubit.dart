import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/feature_admin/orders/data/cancel_order_admin.dart';
import 'package:webbing_fixed/feature_admin/orders/data/cancel_order_admin.dart';
import 'package:webbing_fixed/feature_admin/orders/data/cancel_order_admin.dart';
import 'package:webbing_fixed/feature_admin/orders/data/get_all_order_accept.dart';
import 'package:webbing_fixed/feature_admin/orders/data/get_all_order_cancel.dart';
import 'package:webbing_fixed/feature_admin/orders/data/get_all_order_complete.dart';
import 'package:webbing_fixed/feature_admin/orders/data/review_admin_data.dart';
import 'package:webbing_fixed/feature_admin/orders/model/review_admin.dart';
import 'order_state.dart';



class OrderCubit extends Cubit<OrderState> {
  final GetAllOrderCompleteRepository getAllOrderCompleteRepository;
  final GetAllOrderAcceptRepository getAllOrderAcceptRepository;
  final GetAllOrderCancelRepository getAllOrderCancelRepository;
  final CancelOrderAdmin _cancelOrderAdmin;
  final ReviewAdminService _reviewAdminService;
  OrderCubit(this.getAllOrderCompleteRepository, this.getAllOrderAcceptRepository, this.getAllOrderCancelRepository, this._cancelOrderAdmin, this._reviewAdminService) : super(OrderInitial());

  Future<void> CancelOrderWithAdmin(int id) async {
    try {
      emit(OrderLoading());

      final getOrder = await _cancelOrderAdmin.cancelOrderAdmin(id);
      emit(CancelOrderAdminLoaded(getOrder));
    } catch (e) {
      emit(OrderErrorState('Failed to load data: $e'));
    }
  }
  Future<void> getAllOrderComplete() async {
    try {
      emit(OrderLoading());

      final getOrder = await getAllOrderCompleteRepository.getAllOrderComplete();
      emit(OrderLoadedComplete(getOrder));
    } catch (e) {
      emit(OrderErrorState('Failed to load data: $e'));
    }
  }
  Future<void> getAllOrderAccept() async {
    try {
      emit(OrderLoading());

      final getOrder = await getAllOrderAcceptRepository.getAllOrderAccept();
      emit(OrderLoadedAccept(getOrder));
    } catch (e) {
      emit(OrderErrorState('Failed to load data: $e'));
    }
  }
  Future<void> getAllOrderCancel() async {
    try {
      emit(OrderLoading());

      final getOrder = await getAllOrderCancelRepository.getAllOrderCancel();
      emit(OrderLoadedCancel(getOrder));
    } catch (e) {
      emit(OrderErrorState('Failed to load data: $e'));
    }
  }

  Future<void> reviewAdminServices(int rate, int id,BuildContext context) async {
    try {
      emit(OrderLoading());

      final servicesRequest = ReviewAdminRequest(rating: rate);
      final service = await _reviewAdminService.reviewAdminService(servicesRequest, id);

      service.fold(
            (failure) {
          emit(OrderErrorState('لقد قمت بالفعل بتقييم هذا مقدم الخدمة'));
          showSnackbar(context, 'لقد قمت بالفعل بتقييم هذا مقدم الخدمة', Colors.red);

              // Emit error message
        },
            (reviewResponse) {
          emit(ServiceAdminLoaded(reviewResponse));
          showSnackbar(context, 'تم إرسال التقييم بنجاح', Colors.green);

        },
      );
    } catch (e) {
      emit(OrderErrorState('Error: $e'));
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
