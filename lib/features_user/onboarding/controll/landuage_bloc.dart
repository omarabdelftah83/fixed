import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Language { arabic, english }

class LanguageCubit extends Cubit<Language> {
  LanguageCubit() : super(Language.english);

  Future<void> changeLanguage(Language selectedLanguage, BuildContext context) async {
    Locale locale;
    switch (selectedLanguage) {
      case Language.arabic:
        locale = Locale('ar', 'SA');
        break;
      case Language.english:
        locale = Locale('en', 'US');
        break;
    }
    await EasyLocalization.of(context)!.setLocale(locale);
    await _saveLanguage(locale.languageCode);
    emit(selectedLanguage);
  }

  Future<void> _saveLanguage(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
  }
}
