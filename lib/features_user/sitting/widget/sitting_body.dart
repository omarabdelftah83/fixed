import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webbing_fixed/core/app_text/AppText.dart';
import 'package:webbing_fixed/core/route/routes.dart';
import 'package:webbing_fixed/core/text_failed/drop_down_custom_textfailed.dart';
import 'package:webbing_fixed/features_user/onboarding/controll/on_boarding_cubit.dart';
import 'package:webbing_fixed/features_user/sitting/widget/custom_listtile.dart';
import 'package:webbing_fixed/features_user/sitting/widget/custom_switch.dart';

class Settingbody extends StatefulWidget {
  const Settingbody({super.key});

  @override
  State<Settingbody> createState() => _SettingbodyState();
}

class _SettingbodyState extends State<Settingbody> {
  String _selectedLanguage = 'A';
  String _selectedCountry = 'الكويت';

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
      print('Selected Country: $_selectedCountry');
      context.read<OnBoardingCubit>().sendCountryAndLanguage(_selectedLanguage, _selectedCountry);
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
     context.read<OnBoardingCubit>().sendCountryAndLanguage(_selectedLanguage, _selectedCountry);
    Navigator.pushNamed(context, Routes.mainLayoutPageAdmin);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
            const Center(
              child: CustomText(
                textColor: Color(0XFF8D8383),
                text: 'الاعدادات',
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),
            DropDownCustomTextfailed(
              suffixIcon: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              hintText: 'تعديل الملف الشخصي',
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
              hintText: 'المحفظة',
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
              hintText: ' اللغه',
              dropdownItems: ['العربية', 'english'],
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
              hintText: ' الدوله',
              dropdownItems: ["مصر", "الكويت"],
              onDropdownChanged: (selectedItem) {
                _changeCountry(selectedItem);
              },
            ),
            SizedBox(height: 16.h),
            CustomSwitch(
              border: Border.all(color: Colors.grey, width: 1.0),
              value: true,
              text: 'حفظ كلمة المرور',
              icon: Icons.lock,
              onChanged: (value) {},
            ),
            SizedBox(height: 16.h),
            CustomSwitch(
              border: Border.all(color: Colors.grey, width: 1.0),
              value: true,
              text: 'حفظ البصة',
              icon: Icons.fingerprint,
              onChanged: (value) {},
            ),
            SizedBox(height: 16.h),
            CustomListtile(
              text: 'الشروط والاحكام',
              icon: Icons.document_scanner,
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            CustomListtile(
              text: 'تسجيل الخروج',
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
