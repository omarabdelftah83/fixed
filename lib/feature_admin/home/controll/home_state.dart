import 'package:webbing_fixed/feature_admin/home/data/delete_notification_admin.dart';
import 'package:webbing_fixed/feature_admin/home/model/get_all_order_model.dart';
import 'package:webbing_fixed/feature_admin/home/model/get_user_model.dart';
import 'package:webbing_fixed/feature_admin/home/model/notification_admin.dart';
import 'package:webbing_fixed/features_user/home/model/notification_user_delete.dart';
abstract class HomeState {}
class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeDataLoaded extends HomeState {
  final List<GetOrderModel> services;
  final List<GetUserModel> users;
  HomeDataLoaded(this.services, this.users);
}
class DeleteNotificationAdminLoaded extends HomeState {
  final NotificationUserDelete notifications;
  DeleteNotificationAdminLoaded(this.notifications);
}

class NotificationAdminLoaded extends HomeState {
  final List<NotificationAdmin> notifications;
  NotificationAdminLoaded(this.notifications);
}
class HomeErrorState extends HomeState {
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}
