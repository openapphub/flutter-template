import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'storage_keys.dart';

class StorageService extends GetxService {
  late GetStorage _box;

  Future<StorageService> init() async {
    _box = GetStorage();
    await _box.initStorage;
    return this;
  }

  T? read<T>(StorageKeys key) {
    return _box.read<T>(key.value);
  }

  void write(StorageKeys key, dynamic value) {
    _box.write(key.value, value);
  }

  void remove(StorageKeys key) {
    _box.remove(key.value);
  }

  void clearAll() {
    _box.erase();
  }
}
