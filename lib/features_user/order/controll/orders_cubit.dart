import 'package:bloc/bloc.dart';
import 'package:webbing_fixed/features_user/order/%20model/review_model_user.dart';
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

  OrdersUserCubit(this.getAllOrderCompleteUserRepository,
      this.getAllOrderAcceptUserRepository,
      this.getAllOrderCancelUserRepository, this.reviewService)
      : super(OrdersInitial()) {
  }

  Future<void> getAllOrderCompleteUser() async {
    try {
      emit(OrderLoadingUser());

      final getOrder =
      await getAllOrderCompleteUserRepository.getAllOrderCompleteUser();
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

  Future<void> reviewServices(int rate,int id) async {
    try {
      emit(OrderLoadingUser());
      final servicesRequest = ReviewRequest(
          rating: rate );

      final service = await reviewService.reviewService(servicesRequest,id);
    //  emit(ServiceIdLoaded(service));
    } catch (e) {
      print('Error in fetchServiceId: $e');
      emit(OrderErrorStateUser(e.toString()));
    }
  }

}
