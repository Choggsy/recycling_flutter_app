import 'package:flutter/services.dart';

class TestAssetBundle extends AssetBundle {
  final Map<String, String> _mockData;
  final Set<String> _errorKeys;

  TestAssetBundle(this._mockData, {Set<String>? errorKeys}) : _errorKeys = errorKeys ?? {};

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (_errorKeys.contains(key)) {
      throw Exception('Error loading JSON');
    }
    if (_mockData.containsKey(key)) {
      return _mockData[key]!;
    }
    throw Exception('Error loading JSON');
  }

  @override
  Future<ByteData> load(String key) {
    throw UnimplementedError();
  }
}
