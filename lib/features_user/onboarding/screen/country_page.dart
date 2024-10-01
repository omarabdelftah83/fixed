import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:webbing_fixed/core/text_failed/drop_down_custom_textfailed.dart';
import 'package:webbing_fixed/features_user/onboarding/controll/on_boarding_cubit.dart';
import 'package:webbing_fixed/features_user/onboarding/controll/on_boarding_state.dart';
import 'on_boarding_export.dart';


class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  String _selectedLanguage = 'A';
  String _selectedCountry = 'الكويت';

  void _changeLanguage(String? selectedItem) {
    if (selectedItem != null) {
      setState(() {
        _selectedLanguage = selectedItem == 'العربيه' ? 'A' : 'E';
      });
    }
  }
  void _changeCountry(String? selectedItem) {
    if (selectedItem != null) {
      setState(() {
        _selectedCountry = selectedItem;
      });
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 95.h),
            Image.asset(AppAssets.inHomeImage),
            SizedBox(height: 10.h),
            Stack(
              children: [
                Container(
                  height: 690.h,
                  margin: const EdgeInsets.only(top: 40),
                  decoration: const BoxDecoration(
                    color: Color(0xFF3EBBDD),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 0.0,
                  right: 0.0,
                  bottom: 10,
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                const SizedBox(height: 50),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: CustomText(
                                    text: 'الدوله',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                DropDownCustomTextfailed(
                                  prefixIcon: const Icon(Icons.arrow_drop_down),
                                  hintText: 'اختر الدوله',
                                  dropdownItems: ['الكويت', 'مصر'],
                                  onDropdownChanged: (selectedItem) {
                                    _changeCountry(selectedItem);
                                  },
                                ),
                                const SizedBox(height: 10),
                                const Align(
                                  alignment: Alignment.topRight,
                                  child: CustomText(
                                    text: 'اللغه',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                DropDownCustomTextfailed(
                                  prefixIcon: const Icon(Icons.arrow_drop_down),
                                  hintText: 'اختر اللغه',
                                  dropdownItems: ['العربيه', 'english'],
                                  onDropdownChanged: (selectedItem) {
                                    _changeLanguage(selectedItem);
                                  },
                                ),
                                const SizedBox(height: 80),
                                CustomButton(
                                  width: 343.w,
                                  onPressed: _applyLanguage,
                                  text: 'حفظ',
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
