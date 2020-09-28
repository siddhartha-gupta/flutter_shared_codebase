import 'package:localstorage/localstorage.dart';
import 'package:lzstring/lzstring.dart';

class LocalStorageService {
  static LocalStorage storage;

  static Future<void> initialize(String storageName) {
    storage = new LocalStorage(storageName);

    return storage.ready;
  }

  static Future<dynamic> getItem(key) async {
    var item = storage.getItem(key);

    return item != null ? await LZString.decompress(item) : Future.value(null);
  }

  static Future<void> setItem(key, value) async {
    String val = await LZString.compress(value);

    storage.setItem(key, val);
  }

  static Future<void> deleteItem(key) async {
    await storage.deleteItem(key);
  }
}
