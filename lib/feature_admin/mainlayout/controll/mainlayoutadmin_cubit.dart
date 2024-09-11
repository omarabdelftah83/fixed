import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';
import 'package:webbing_fixed/feature_admin/home/home_page_admin.dart';
import 'package:webbing_fixed/feature_admin/mainlayout/controll/mainlayoutadmin_state.dart';
import 'package:webbing_fixed/feature_admin/orders/oders_page_admin.dart';
import 'package:webbing_fixed/features_user/sitting/sitting_page.dart';

class MainLayOutAdminCubit extends Cubit<MainLayoutAdminState> {
  MainLayOutAdminCubit() : super(MainLayoutAdminState(0));
  final List<String> labels = [
    'الرئيسيه',
    'الطلبات',
    'الاعدادات',

  ];
  List<Widget> pages = [
    const HomePageAdmin(),
    const OrdersPageAdmin(),
    const SettingPage(),


  ];

  // Define your icons
  List<String> icons = [
    AssetsManager.iconHome,
    AssetsManager.iconOrder,
    AssetsManager.iconSetting,

  ];

  void updateSelectedIndex(int index) {
    emit(MainLayoutAdminState(index));
  }
}
