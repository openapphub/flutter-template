import 'dart:ui';

import 'package:get/get.dart';

import 'package:flutter_template/core/translation/translation_service.dart';

class SettingsController extends GetxController {
  final TranslationService _translationService = Get.find<TranslationService>();

  void changeLanguage(String languageCode, String? countryCode) {
    _translationService.changeLocale(languageCode, countryCode);
  }

  String get currentLanguage => _translationService.getCurrentLanguageName();

  List<Locale> get supportedLocales => _translationService.supportedLocales;

  Locale? get currentLocale {
    final currentLocale = Get.locale;
    if (supportedLocales.contains(currentLocale)) {
      return currentLocale;
    }
    return null;
  }
}
