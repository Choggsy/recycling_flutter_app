import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/helper/upcycling_service.dart';

class MockAssetBundle extends AssetBundle {
  final String mockJson;

  MockAssetBundle(this.mockJson);

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    return mockJson;
  }

  @override
  Future<ByteData> load(String key) {
    throw UnimplementedError();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const mockJson = '''
  {
    "upcycling_tutorials": [
      {
        "title": "Wine Cork Key Holder",
        "photo": "assets/logo/placeholder.jpg",
        "categories": ["utility"]
      },
      {
        "title": "CD Mosaic Coasters",
        "photo": "assets/logo/placeholder.jpg",
        "categories": ["craft"]
      },
      {
        "title": "Plastic Bottle Drip Irrigation",
        "photo": "assets/logo/placeholder.jpg",
        "categories": ["garden"]
      }
    ]
  }
  ''';

  late AssetBundle mockBundle;

  setUp(() {
    mockBundle = MockAssetBundle(mockJson);
    // Override rootBundle globally for the test
    ServicesBinding.instance.defaultBinaryMessenger.setMockMessageHandler(
      'flutter/assets',
          (message) async => null,
    );
  });

  test('Loads all tutorials when category is "all"', () async {
    final result = await UpcyclingService.loadTutorialImagesByCategory('all');
    expect(result.length, 3);
    expect(result[0].key, 'assets/logo/placeholder.jpg');
    expect(result[1].key, 'assets/logo/placeholder.jpg');
    expect(result[2].key, 'assets/logo/placeholder.jpg');
  });

  test('Filters tutorials by "craft" category', () async {
    final result = await UpcyclingService.loadTutorialImagesByCategory('craft');
    expect(result.length, 1);
    expect(result[0].key, 'assets/logo/placeholder.jpg');
  });

  test('Filters tutorials by "utility" category', () async {
    final result = await UpcyclingService.loadTutorialImagesByCategory('utility');
    expect(result.length, 1);
    expect(result[0].key, 'assets/logo/placeholder.jpg');
  });

  test('Filters tutorials by "garden" category', () async {
    final result = await UpcyclingService.loadTutorialImagesByCategory('garden');
    expect(result.length, 1);
    expect(result[0].key, 'assets/logo/placeholder.jpg');
  });

  test('Returns empty list for unknown category', () async {
    final result = await UpcyclingService.loadTutorialImagesByCategory('nonexistent');
    expect(result, isEmpty);
  });
}
