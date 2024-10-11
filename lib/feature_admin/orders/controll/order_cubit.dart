import 'package:bloc/bloc.dart';
import 'package:webbing_fixed/feature_admin/orders/data/cancel_order_admin.dart';
import 'package:webbing_fixed/feature_admin/orders/data/cancel_order_admin.dart';
import 'package:webbing_fixed/feature_admin/orders/data/cancel_order_admin.dart';
import 'package:webbing_fixed/feature_admin/orders/data/get_all_order_accept.dart';
import 'package:webbing_fixed/feature_admin/orders/data/get_all_order_cancel.dart';
import 'package:webbing_fixed/feature_admin/orders/data/get_all_order_complete.dart';
import 'order_state.dart';



class OrderCubit extends Cubit<OrderState> {
  final GetAllOrderCompleteRepository getAllOrderCompleteRepository;
  final GetAllOrderAcceptRepository getAllOrderAcceptRepository;
  final GetAllOrderCancelRepository getAllOrderCancelRepository;
  final CancelOrderAdmin _cancelOrderAdmin;
  OrderCubit(this.getAllOrderCompleteRepository, this.getAllOrderAcceptRepository, this.getAllOrderCancelRepository, this._cancelOrderAdmin) : super(OrderInitial());

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



}
