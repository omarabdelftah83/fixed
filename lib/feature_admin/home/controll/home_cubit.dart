import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_state.dart';
import 'package:webbing_fixed/feature_admin/home/data/delete_notification_admin.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_all_order.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_user_data.dart';
import 'package:webbing_fixed/feature_admin/home/data/notification_admin_data.dart';
import 'package:webbing_fixed/feature_admin/home/data/post_price_data.dart';
import 'package:webbing_fixed/feature_admin/home/model/post_price.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllOrderRepository getAllOrderRepository;
  final GetUserRepository getUserRepository;
  final ApiOfferPriceService apiOfferPriceService;
  final GetNotificationAdminService _getNotificationAdminService;
  final TextEditingController priceController = TextEditingController();
  final TextEditingController comment = TextEditingController();
  final DeleteNotificationAdmin _deleteNotificationAdmin;

  HomeCubit(
      this.getAllOrderRepository,
      this.getUserRepository,
      this.apiOfferPriceService,
      this._getNotificationAdminService,
      this._deleteNotificationAdmin)
      : super(HomeInitial());

  Future<void> deleteNotificationAdmin(int id ) async {
    try {
      emit(HomeLoading());
      final service = await _deleteNotificationAdmin.deleteNotificationAdmin(id);
      await getNotificationAdmin();
    } catch (e) {
      print('Error in fetchServiceId: $e');
      emit(HomeErrorState(e.toString()));
    }
  }

  Future<void> getNotificationAdmin() async {
    try {
      emit(HomeLoading());
      final user = await _getNotificationAdminService.getNotificationAdmin();
      emit(NotificationAdminLoaded(user));
    } catch (e) {
      emit(HomeErrorState('Failed to load data: $e'));
    }
  }

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

  Future<void> offerPrice(BuildContext context,int id ) async {
    if (apiOfferPriceService == null) {
      print('ApiOfferPriceService is null');
      return; // Prevent further execution
    }

    if (priceController.text.isEmpty) {
      print('Price or comment cannot be empty');
      return; // Prevent further execution
    }

    final priceModel = RequestPrice(
      price: priceController.text,
    );

    final result = await apiOfferPriceService.offerPriceOrder(priceModel,id );

    result.fold(
          (failure) {
       // print('Error: ${failure.message}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Price offered successfully!')),
        );
      },
          (success) {
        print('Price offered successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Price offered successfully!')),
        );
      },
    );
  }
}
