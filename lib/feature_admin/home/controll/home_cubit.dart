import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/feature_admin/home/controll/home_state.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_all_order.dart';
import 'package:webbing_fixed/feature_admin/home/data/get_user_data.dart';
import 'package:webbing_fixed/feature_admin/home/data/post_price_data.dart';
import 'package:webbing_fixed/feature_admin/home/model/post_price.dart';


class HomeCubit extends Cubit<HomeState> {
  final GetAllOrderRepository getAllOrderRepository;
  final GetUserRepository getUserRepository;
  final ApiOfferPriceService apiOfferPriceService;
  final TextEditingController priceController = TextEditingController();
  final TextEditingController comment = TextEditingController();

  HomeCubit(this.getAllOrderRepository, this.getUserRepository, this.apiOfferPriceService) : super(HomeInitial());

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
  Future<void> offerPrice() async {
    if (apiOfferPriceService == null) {
      print('ApiOfferPriceService is null');
      return; // Prevent further execution
    }

    // تحقق من أن priceController و comment ليسا فارغين
    if (priceController.text.isEmpty ) {
      print('Price or comment cannot be empty');
      return; // Prevent further execution
    }

    final priceModel = RequestPrice(
      price: priceController.text,
    );

    final result = await apiOfferPriceService.offerPriceOrder(priceModel);

    result.fold(
          (failure) {
        print('Error: ${failure.message}');
      },
          (success) {
        print('Price offered successfully');
      },
    );
  }


}
