
import 'package:webbing_fixed/feature_admin/home/model/get_all_order_model.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<GetOrderModel> services;
  HomeLoaded(this.services);

}


class HomeErrorState extends HomeState {
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}