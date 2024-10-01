import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';
import 'package:webbing_fixed/feature_admin/home/home_page_admin.dart';
import 'package:webbing_fixed/feature_admin/mainlayout/controll/mainlayoutadmin_state.dart';
import 'package:webbing_fixed/feature_admin/orders/oders_page_admin.dart';
import 'package:webbing_fixed/features_user/sitting/sitting_page.dart';

class MainLayOutAdminCubit extends Cubit<MainLayoutAdminState> {
  MainLayOutAdminCubit() : super(MainLayoutAdminState(2));
  final List<String> labels = [
    'الاعدادات',
    'الطلبات',
    'الرئيسيه',



  ];
  List<Widget> pages = [
    const SettingPage(),
    const OrdersPageAdmin(),
    const HomePageAdmin(),



  ];

  // Define your icons
  List<String> icons = [
    AssetsManager.iconSetting,
    AssetsManager.iconOrder,
    AssetsManager.iconHome,


  ];

  void updateSelectedIndex(int index) {
    emit(MainLayoutAdminState(index));
  }
}
