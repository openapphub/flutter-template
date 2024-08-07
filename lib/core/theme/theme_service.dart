import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../infrastructure/services/storage/storage_service.dart';
import '../../infrastructure/services/storage/storage_keys.dart';

class ThemeService extends GetxService {
  late StorageService _storageService;

  Future<ThemeService> init() async {
    _storageService = Get.find<StorageService>();
    return this;
  }

  ThemeMode get theme =>
      _loadThemeFromStorage() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromStorage() =>
      _storageService.read<bool>(StorageKeys.isDarkMode) ?? false;

  void _saveThemeToStorage(bool isDarkMode) =>
      _storageService.write(StorageKeys.isDarkMode, isDarkMode);

  void switchTheme() {
    Get.changeThemeMode(
        _loadThemeFromStorage() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToStorage(!_loadThemeFromStorage());
  }
}
