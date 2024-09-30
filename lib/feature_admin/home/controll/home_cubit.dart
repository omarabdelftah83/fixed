import 'package:bloc/bloc.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_state.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_all_order.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_user_data.dart';
import 'package:webbing_fixed/feature_admin/home/model/get_user_model.dart';


class HomeCubit extends Cubit<HomeState> {
  final GetAllOrderRepository getAllOrderRepository;
  final GetUserRepository getUserRepository;

  HomeCubit(this.getAllOrderRepository, this.getUserRepository) : super(HomeInitial());

  Future<void> fetchData() async {
    try {
      emit(HomeLoading());

      final getOrder = await getAllOrderRepository.getAllOrderHome();
      final user = await getUserRepository.getUserData();

      if (user != null) {
        emit(HomeDataLoaded(getOrder, [user]));
      } else {
        emit(HomeErrorState('No user data found'));
      }
    } catch (e) {
      emit(HomeErrorState('Failed to load data: $e'));
    }
  }
}
