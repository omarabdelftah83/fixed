import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/text_failed/drop_down_custom_textfailed.dart';
import 'package:webbing_fixed/features_user/sitting/widget/custom_listtile.dart';
import 'package:webbing_fixed/features_user/sitting/widget/custom_switch.dart';
import 'package:webbing_fixed/features_user/sitting_user/controll/lang_user_cubit.dart';
import 'package:webbing_fixed/helpers/cache_helper.dart';

class SettingUserbody extends StatefulWidget {
  const SettingUserbody({super.key});

  @override
  State<SettingUserbody> createState() => _SettingUserbodyState();
}

class _SettingUserbodyState extends State<SettingUserbody> {
  String _selectedLanguage = 'A';
  String _selectedCountry = 'الكويت';
  bool _savePassword = false; // Track the state of the save password option

  void _changeLanguage(String? selectedItem) {
    if (selectedItem != null) {
      setState(() {
        _selectedLanguage = selectedItem == 'العربية' ? 'A' : 'E';
      });
      _applyLanguage(); // استدعاء _applyLanguage هنا
    }
  }

  void _changeCountry(String? selectedItem) {
    if (selectedItem != null) {
      setState(() {
        _selectedCountry = selectedItem;
      });
      print('Selected Country: $_selectedCountry'); // تحقق من الدولة المحددة

      context.read<LangUserCubit>().sendCountryAndLanguage(_selectedLanguage, _selectedCountry);
    }
  }


  void _applyLanguage() {
    Locale locale;
    switch (_selectedLanguage) {
      case 'A': // Arabic
        locale = Locale('ar', 'SA');
        break;
      case 'E': // English
        locale = Locale('en', 'US');
        break;
      default:
        locale = Locale('en', 'US');
    }

    EasyLocalization.of(context)?.setLocale(locale);
    context.read<LangUserCubit>().sendCountryAndLanguage(_selectedLanguage, _selectedCountry);
    Navigator.pushNamed(context, Routes.mainLayoutPage);
  }
  Future<void> _savePasswordSetting() async {
    await CacheHelper.putBoolean(key: 'Password', value: _savePassword);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_savePassword ? 'Password saving enabled' : 'Password saving disabled'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
             Center(
              child: CustomText(
                textColor: Color(0XFF8D8383),
                text: 'Sitting'.tr(),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),

            DropDownCustomTextfailed(
              suffixIcon: const Icon(
                Icons.home,
                color: Colors.blue,
              ),
              hintText: 'edit_profile'.tr(),
              onTap: () {
                Navigator.pushNamed(context, Routes.homeProfile);
              },
            ),
            SizedBox(height: 16.h),
            DropDownCustomTextfailed(
              suffixIcon: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              hintText: 'edit_profile'.tr(),
              onTap: () {
                Navigator.pushNamed(context, Routes.editProfile);
              },
            ),
            SizedBox(height: 16.h),
            DropDownCustomTextfailed(
              suffixIcon: const Icon(
                Icons.wallet_travel,
                color: Colors.blue,
              ),
              hintText: 'wallet'.tr(),
              onTap: () {
                Navigator.pushNamed(context, Routes.walletPage);
              },
            ),
            SizedBox(height: 16.h),
            DropDownCustomTextfailed(
              suffixIcon: const Icon(
                Icons.language,
                color: Colors.blue,
              ),
              prefixIcon: const Icon(Icons.arrow_drop_down),
              hintText: ' language'.tr(),
              dropdownItems: ['العربية', 'English'],
              onDropdownChanged: (selectedItem) {
                _changeLanguage(selectedItem);
              },
            ),
            SizedBox(height: 16.h),
            DropDownCustomTextfailed(
              suffixIcon: const Icon(
                Icons.public,
                color: Colors.blue,
              ),
              prefixIcon: const Icon(Icons.arrow_drop_down),
              hintText: ' country'.tr(),
              dropdownItems: ["مصر", "الكويت"],
              onDropdownChanged: (selectedItem) {
                _changeCountry(selectedItem);
              },
            ),
            SizedBox(height: 16.h),
            CustomSwitch(
              border: Border.all(color: Colors.grey, width: 1.0),
              value: _savePassword, // استخدم المتغير لتتبع حالة المفتاح
              text: 'save pass'.tr(),
              icon: Icons.lock,
              onChanged: (value) async {
                setState(() {
                  _savePassword = value;
                });

                if (_savePassword) {
                  String password = 'yourPassword';
                  await CacheHelper.savePassword(password);
                } else {

                  await CacheHelper.clearPassword();
                }
                _savePasswordSetting();
              },
            ),

            SizedBox(height: 16.h),

            SizedBox(height: 16.h),
            CustomListtile(
              text: 'terms_conditions'.tr(),
              icon: Icons.document_scanner,
              onTap: () {
                Navigator.pushNamed(context, Routes.conditionsPage);
              },
            ),
            SizedBox(height: 16.h),
            CustomListtile(
              text: 'logout'.tr(),
              icon: Icons.logout,
              isLogout: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
