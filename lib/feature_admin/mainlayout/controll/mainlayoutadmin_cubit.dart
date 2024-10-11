import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webbing_fixed/core/resource/assets_manager.dart';
import 'package:webbing_fixed/feature_admin/home/home_page_admin.dart';
import 'package:webbing_fixed/feature_admin/mainlayout/controll/mainlayoutadmin_state.dart';
import 'package:webbing_fixed/feature_admin/orders/oders_page_admin.dart';
import 'package:webbing_fixed/features_user/sitting/sitting_page.dart';

class MainLayOutAdminCubit extends Cubit<MainLayoutAdminState> {
  MainLayOutAdminCubit() : super(MainLayoutAdminState(0));

  final List<String> labels = [
    'appbareSetingString2'.tr(),
    'appbareOrderString2'.tr(),
    'set_location2'.tr(),
  ];

  List<Widget> pages = [
    const HomePageAdmin(),
    const OrdersPageAdmin(),
    const SettingPage(),
  ];

  // Define your icons (you don't need translation for icons)
  List<String> icons = [
    AssetsManager.iconHome,
    AssetsManager.iconOrder,
    AssetsManager.iconSetting,
  ];

  void updateSelectedIndex(int index) {
    emit(MainLayoutAdminState(index));
  }
}
