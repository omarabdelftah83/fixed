import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webbing_fixed/feature_admin/auth/sign_up/data/get_all_service.dart';
import 'package:webbing_fixed/features_user/home/data/best_offer.dart';
import 'package:webbing_fixed/features_user/home/data/create_order_user.dart';
import 'package:webbing_fixed/features_user/home/data/delete_notification_user.dart';
import 'package:webbing_fixed/features_user/home/data/notification_user_data.dart';
import 'package:webbing_fixed/features_user/home/data/order_service.dart';
import 'package:webbing_fixed/features_user/home/data/reject_and_accept.dart';
import 'package:webbing_fixed/features_user/home/model/create_order_model.dart';
import 'package:webbing_fixed/features_user/home/model/reject_and_accept.dart';
import 'home_user_state.dart';

class HomeUserCubit extends Cubit<HomeUserState> {
  final GetAllService getAllService;
  final GetOrderServiceId getOrderServiceId;
  final CreateOrderService _createOrderService;
  final GetBestOffer getBestOffer;
  final RejectAndAcceptService rejectAndAcceptService;
  final DeleteNotificationUser _deleteNotificationUser;
  final GetNotificationUserService getNotificationUserService;
  TextEditingController imageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final ImagePicker picker = ImagePicker();
  XFile? selectedImage;
  double containerHeight = 50.0;

  int unitCount = 0;
  String? selectedServiceId;
  String? selectedTime; // متغير لوقت الخدمة
  String imageType = "defaultType"; // تأكد من إعطائه قيمة صحيحة
  double? currentLatitude;
  double? currentLongitude;
  HomeUserCubit(
      this.getAllService,
      this.getOrderServiceId,
      this._createOrderService,
      this.getBestOffer,
      this.rejectAndAcceptService,
      this.getNotificationUserService,
      this._deleteNotificationUser,
      ) : super(HomeUserInitial());

  void increment() {
    unitCount++;
    emit(UnitCountChanged(unitCount));
  }

  void decrement() {
    if (unitCount > 0) {
      unitCount--;
      emit(UnitCountChanged(unitCount));
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = pickedFile; // عيّن القيمة مباشرة إلى selectedImage
      containerHeight = 150.0;
      emit(ImageUploadingState(imageType)); // استخدام imageType
      await _uploadImage(pickedFile.path, imageType);
    } else {
      print("No image selected.");
    }
  }

  Future<void> _uploadImage(String imagePath, String imageType) async {
    await Future.delayed(Duration(seconds: 1));
    emit(ImageUploadCompletedState(imageType));
  }

  Future<void> fetchServices() async {
    try {
      emit(HomeUserLoading());
      final services = await getAllService.getAll();
      emit(ServicesLoaded(services));
    } catch (e) {
      print('Error in fetchServices: $e');
      emit(HomeUserErrorState(e.toString()));
    }
  }

  Future<void> postRejectAndService(int id, String decision) async {
    try {
      emit(HomeUserLoading());
      final servicesRequest = RejectAndAcceptRequest(decision: decision);
      final services = await rejectAndAcceptService.rejectAndAccept(servicesRequest, id);
      fetchBestOffer();
    } catch (e) {
      print('Error in fetchServices: $e');
      emit(HomeUserErrorState(e.toString()));
    }
  }

  Future<void> getNotificationUser() async {
    try {
      emit(HomeUserLoading());
      final service = await getNotificationUserService.getNotificationUser();
      emit(NotificationUserLoaded(service));
    } catch (e) {
      print('Error in fetchServiceId: $e');
      emit(HomeUserErrorState(e.toString()));
    }
  }
  Future<void> deleteNotificationUser(int id ) async {
    try {
      emit(HomeUserLoading());
      final service = await _deleteNotificationUser.deleteNotificationUser(id);
      await  getNotificationUser();
    } catch (e) {
      print('Error in fetchServiceId: $e');
      emit(HomeUserErrorState(e.toString()));
    }
  }


  Future<void> fetchServiceId(int id) async {
    try {
      emit(HomeUserLoading());
      final service = await getOrderServiceId.getServiceId(id);
      emit(ServiceIdLoaded(service));
    } catch (e) {
      print('Error in fetchServiceId: $e');
      emit(HomeUserErrorState(e.toString()));
    }
  }

  void setCurrentLocation(double lat, double lon) {
    currentLatitude = lat;
    currentLongitude = lon;
    print("Current Location: Latitude===: $currentLatitude, Longitude====: $currentLongitude");
  }

  Future<void> createOrderService(int id, BuildContext context) async {
    try {
      emit(HomeUserLoading());

      if (currentLatitude == null || currentLongitude == null) {
        return;
      }

      final servicesRequest = CreateOrderRequest(
        typeService: selectedServiceId,
        time: selectedTime,
        location: locationController.text,
        image: selectedImage != null ? File(selectedImage!.path) : null,
        description: descriptionController.text,
        count: unitCount,
        lat: currentLatitude,
        lon: currentLongitude,
      );

      // استدعاء خدمة إنشاء الطلب
      final result = await _createOrderService.createOrderServices(servicesRequest, id);

      // التعامل مع النتيجة
      result.fold(
            (failure) {
          emit(HomeUserErrorState(failure.message));
        },
            (services) {
          emit(OrderCreatedSuccess(services));
        },
      );
    } catch (e) {
      print('Error in createOrderService: $e');
      emit(HomeUserErrorState(e.toString()));
    }
  }

  Future<void> fetchBestOffer() async {
    try {
      emit(HomeUserLoading());
      final services = await getBestOffer.getBestOffer();
      emit(BestOfferLoaded(services));
    } catch (e) {
      print('Error in fetchServices: $e');
      emit(HomeUserErrorState(e.toString()));
    }
  }

  void clearImage() {
    selectedImage = null;
    containerHeight = 50.0;
    emit(ImageUploadCompletedState(imageType));
  }

  @override
  Future<void> close() {
    locationController.dispose();
    descriptionController.dispose();
    return super.close();
  }
}
