import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../generated/locales.g.dart';
import '../../infrastructure/services/storage/storage_keys.dart';
import '../../infrastructure/services/storage/storage_service.dart';

class TranslationService extends Translations {
  late StorageService _storageService;

  Future<TranslationService> init() async {
    _storageService = Get.find<StorageService>();
    return this;
  }

  @override
  Map<String, Map<String, String>> get keys => AppTranslation.translations;

  Locale? get savedLocale {
    final String? languageCode =
        _storageService.read<String>(StorageKeys.languageCode);
    final String? countryCode =
        _storageService.read<String>(StorageKeys.countryCode);
    if (languageCode != null) {
      return Locale(languageCode, countryCode);
    }
    return Get.deviceLocale;
  }

  void saveLocale(Locale locale) {
    _storageService.write(StorageKeys.languageCode, locale.languageCode);
    _storageService.write(StorageKeys.countryCode, locale.countryCode);
  }

  void changeLocale(String languageCode, String? countryCode) {
    final locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
    saveLocale(locale);
  }

  String getCurrentLanguageName() {
    final locale = Get.locale;
    switch (locale?.languageCode) {
      case 'en':
        return 'English';
      case 'zh':
        return '中文';
      // Add more cases for other supported languages
      default:
        return 'Unknown';
    }
  }

  List<Locale> get supportedLocales => AppTranslation.translations.keys
      .map((String key) => Locale(key.split('_')[0], key.split('_')[1]))
      .toList();
}
