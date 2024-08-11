import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_template/core/theme/theme_service.dart';
import 'package:flutter_template/generated/locales.g.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('current_language'.tr),
            subtitle: Text(controller.currentLanguage),
            trailing: DropdownButton<Locale>(
              value: controller.currentLocale,
              items: controller.supportedLocales
                  .map((locale) => DropdownMenuItem(
                        value: locale,
                        child: Text(locale.toString()),
                      ))
                  .toList(),
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  controller.changeLanguage(
                      newLocale.languageCode, newLocale.countryCode);
                }
              },
            ),
          ),
          // 其他设置项...
          Text(LocaleKeys.buttons_login.tr),
          // 点击切换主题
          ElevatedButton(
            onPressed: () {
              themeService.switchTheme();
            },
            child: Text('change_theme'.tr),
          ),
        ],
      ),
    );
  }
}
