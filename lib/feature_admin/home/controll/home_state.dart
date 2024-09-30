import 'package:webbing_fixed/feature_admin/home/model/get_all_order_model.dart';
import 'package:webbing_fixed/feature_admin/home/model/get_user_model.dart';
abstract class HomeState {}
class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeDataLoaded extends HomeState {
  final List<GetOrderModel> services;
  final List<GetUserModel> users;
  HomeDataLoaded(this.services, this.users);
}

class HomeErrorState extends HomeState {
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}
