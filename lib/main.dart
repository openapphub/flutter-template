import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'core/theme/app_themes.dart';
import 'core/theme/theme_service.dart';
import 'core/translation/translation_service.dart';
import 'infrastructure/services/logger/log_service.dart';
import 'initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.init();

  final themeService = Get.find<ThemeService>();
  final translationService = Get.find<TranslationService>();
  final LogService _logService = Get.find<LogService>();
  _logService.debug('系统初始化成功');

  runApp(
    GetMaterialApp(
      builder: EasyLoading.init(),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeService.theme,
      translations: translationService,
      locale: translationService.savedLocale,
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: translationService.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ),
  );
}
