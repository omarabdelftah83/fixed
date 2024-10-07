import 'package:webbing_fixed/feature_admin/auth/sign_up/model/get_all_services_model.dart';
import 'package:webbing_fixed/features_user/home/model/create_order_model.dart';
import 'package:webbing_fixed/features_user/home/model/order_service.dart';

// الحالة المجردة الأساسية
abstract class HomeUserState {}

// حالة تغيير عدد الوحدات
class UnitCountChanged extends HomeUserState {
  final int count;
  UnitCountChanged(this.count);
}
class ImageUploadCompletedState extends HomeUserState {
  final String imageType;
  ImageUploadCompletedState(this.imageType);
}
// مثال لتعريف الحالة
class ImageUploadingState extends HomeUserState {
  final String imageType;

  ImageUploadingState(this.imageType);
}

// حالة عند اختيار صورة
class ImagePicked extends HomeUserState {
  final String imagePath;
  final double containerHeight;

  ImagePicked(this.imagePath, this.containerHeight);
}

// الحالة الابتدائية
class HomeUserInitial extends HomeUserState {}

// حالة تحميل البيانات
class HomeUserLoading extends HomeUserState {}

// حالة تحميل الخدمات بنجاح
class ServicesLoaded extends HomeUserState {
  final List<GetAllServicesModel> services;
  ServicesLoaded(this.services);
}

// حالة تحميل خدمة معينة بنجاح
class ServiceIdLoaded extends HomeUserState {
  final OrderServiceModel service;
  ServiceIdLoaded(this.service);
}

// حالة وجود خطأ
class HomeUserErrorState extends HomeUserState {
  final String errorMessage;
  HomeUserErrorState(this.errorMessage);
}
class OrderCreatedSuccess extends HomeUserState {
  final CreateOrderResponse response;

  OrderCreatedSuccess(this.response);
}