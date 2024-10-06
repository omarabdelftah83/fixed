

import 'package:webbing_fixed/feature_admin/auth/sign_up/model/get_all_services_model.dart';
import 'package:webbing_fixed/features_user/home/model/order_service.dart';

abstract class HomeUserState {}
class UnitCountChanged extends HomeUserState {
  final int count;

  UnitCountChanged(this.count);
}

class ImagePicked extends HomeUserState {
  final String imagePath;
  final double containerHeight;

  ImagePicked(this.imagePath, this.containerHeight);
}

final class HomeUserInitial extends HomeUserState {}

final class HomeUserLoading extends HomeUserState {}
class ServicesLoaded extends HomeUserState {
  final List<GetAllServicesModel> services;
  ServicesLoaded(this.services);
}
class ServiceIdLoaded extends HomeUserState {
  final OrderServiceModel service;

  ServiceIdLoaded(this.service);
}

class HomeUserErrorState extends HomeUserState {
  final String errorMessage;
  HomeUserErrorState(this.errorMessage);
}