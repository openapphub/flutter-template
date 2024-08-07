// GetStorage 允许您灵活地使用 set 和 get 方法，而不需要预先声明变量。但是，为了代码的可维护性和类型安全，建议创建一个封装类来管理存储的键。这样可以避免拼写错误和类型不匹配的问题。
// 让我们创建一个 StorageKeys 类来管理键，并使用它来创建一个 StorageService

enum StorageKeys {
  token,
  userId,
  theme,
  language,
  isDarkMode,
  languageCode,
  countryCode,
  authToken,
  refreshToken,
}

extension StorageKeysExtension on StorageKeys {
  String get value {
    return toString().split('.').last;
  }
}
