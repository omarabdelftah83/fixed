import 'package:bloc/bloc.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_state.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_all_order.dart';


class HomeCubit extends Cubit<HomeState> {
  final GetAllOrderRepository getAllOrderRepository;
  HomeCubit(this.getAllOrderRepository) : super(HomeInitial());

  Future<void> getAllOrder() async {
    try {
      emit(HomeLoading());

      final getOrder = await getAllOrderRepository.getAllOrderHome();
      emit(HomeLoaded(getOrder));
    } catch (e) {
      emit(HomeErrorState('Failed to load data: $e'));
    }
  }
}
