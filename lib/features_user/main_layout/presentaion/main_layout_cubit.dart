import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';
import 'package:webbing_fixed/features_user/home/screen/home_page.dart';
import 'package:webbing_fixed/features_user/main_layout/presentaion/main_layout_state.dart';
import 'package:webbing_fixed/features_user/order/order_pag.dart';
import 'package:webbing_fixed/features_user/sitting/setting_page.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenState(0));
  final List<String> labels = [
    'الرئيسيه',
    'الطلبات',
    'الاعدادات',

  ];
  List<Widget> pages = [
    const HomePage(),
    const OrdersPage(),
    const SettingPage(),


  ];

  // Define your icons
  List<String> icons = [
    AssetsManager.iconHome,
    AssetsManager.iconOrder,
    AssetsManager.iconSetting,

  ];

  void updateSelectedIndex(int index) {
    emit(MainScreenState(index));
  }
}
