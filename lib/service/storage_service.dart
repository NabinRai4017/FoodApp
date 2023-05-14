import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  // Create storage
  final _storage = const FlutterSecureStorage();

  factory StorageService() {
    return _instance;
  }

  StorageService._internal() {
    // initialization logic
  }

  Future<String?> read(String key) async {
    String? value = await _storage.read(key: key);
    return value;
  }

  Future<Map<String, String>> readAll() async {
    Map<String, String> allValues = await _storage.readAll();
    return allValues;
  }

  void delete(String key) async {
    await _storage.delete(key: key);
  }

  void deleteAll() async {
    await _storage.deleteAll();
  }

  void write(String key, value) async {
    await _storage.write(key: key, value: value);
  }
}
