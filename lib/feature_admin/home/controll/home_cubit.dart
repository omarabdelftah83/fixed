import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/resource/app_string.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_state.dart';
import 'package:webbing_fixed/feature_admin/home/data/delete_notification_admin.dart';
import 'package:webbing_fixed/feature_admin/home/data/done_compete_order.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_all_order.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_user_data.dart';
import 'package:webbing_fixed/feature_admin/home/data/notification_admin_data.dart';
import 'package:webbing_fixed/feature_admin/home/data/post_price_data.dart';
import 'package:webbing_fixed/feature_admin/home/data/update_price.dart';
import 'package:webbing_fixed/feature_admin/home/model/post_price.dart';
import 'package:webbing_fixed/feature_admin/home/model/update_price.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllOrderRepository getAllOrderRepository;
  final GetUserRepository getUserRepository;
  final ApiOfferPriceService apiOfferPriceService;
  final GetNotificationAdminService _getNotificationAdminService;
  final TextEditingController priceController = TextEditingController();
  final TextEditingController updatePriceController = TextEditingController();
final DoneCompeteOrderAdmin doneCompeteOrderAdmin;
  final TextEditingController comment = TextEditingController();
  final DeleteNotificationAdmin _deleteNotificationAdmin;
final UpdatePriceService updatePriceService;
  HomeCubit(
      this.getAllOrderRepository,
      this.getUserRepository,
      this.apiOfferPriceService,
      this._getNotificationAdminService,
      this._deleteNotificationAdmin, this.updatePriceService, this.doneCompeteOrderAdmin)
      : super(HomeInitial());

  Future<void> deleteNotificationAdmin(int id) async {
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

  Future<void> offerPrice(BuildContext context, int id) async {
    if (priceController.text.isEmpty) {
      print('Price cannot be empty');
      return;
    }

    final priceModel = RequestPrice(
      price: priceController.text,
    );

    final result = await apiOfferPriceService.offerPriceOrder(priceModel, id);

    result.fold(
          (failure) {
        print('Error: ${failure.message}');
        Navigator.of(context).pop();
        priceController.clear();

        showSnackbar(context, 'provider must make a unique set', Colors.red);
      },
          (success) {
            showSnackbar(context, 'update the price', Colors.green);
            Navigator.of(context).pop();
            priceController.clear();
          },
    );
  }
  Future<void> updatePrice(BuildContext context, int id) async {
    if (updatePriceController.text.isEmpty) {
      print('Price cannot be empty');
      return;
    }

    final priceModel = UpdatePriceRequest(
      price: updatePriceController.text,
    );
    final result = await updatePriceService.updatePriceOrder(priceModel, id);
    result.fold(
          (failure) {
        print('Error: ${failure.message}');
        Navigator.of(context).pop();
        updatePriceController.clear();

        showSnackbar(context, 'provider must make a unique set', Colors.red);
      },
          (success) {
        showSnackbar(context, 'update the price', Colors.green);
        updatePriceController.clear();
      },
    );
  }
  Future<void> DoneOrderAdmin(BuildContext context, int id) async {


    final result = await doneCompeteOrderAdmin.doneOrderAdmin(id);
    result.fold(
          (failure) {
        print('Error: ${failure.message}');
        Navigator.of(context).pop();
        updatePriceController.clear();

        showSnackbar(context, 'provider must make a unique set', Colors.red);
      },
          (success) {
        showSnackbar(context, 'complete the order', Colors.green);
        updatePriceController.clear();
        Navigator.pushNamed(context,Routes.mainLayoutPageAdmin);
      },
    );
  }


  void showSnackbar(BuildContext context, String message, Color? color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

}
