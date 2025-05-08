import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/helper/upcycling_service.dart';

void main() {
  const mockJson = '''
  {
    "upcycling_tutorials": [
      {
        "photo": "assets/images/tutorial1.png",
        "categories": ["plastic", "home"]
      },
      {
        "photo": "assets/images/tutorial2.png",
        "categories": ["metal"]
      }
    ]
  }
  ''';

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Mock asset loading
    ServicesBinding.instance.defaultBinaryMessenger.setMockMessageHandler(
      'flutter/assets',
          (ByteData? message) async {
        final String key = utf8.decode(message!.buffer.asUint8List());
        if (key == 'assets/upcycling.json') {
          final encoded = utf8.encode(mockJson);
          return ByteData.view(Uint8List.fromList(encoded).buffer);
        }
        return null;
      },
    );
  });

  test('loadAllTutorials returns all tutorials', () async {
    final tutorials = await UpcyclingService.loadAllTutorials();
    expect(tutorials.length, 2);
    expect(tutorials[0]['photo'], 'assets/images/tutorial1.png');
  });

  test('loadTutorialImagesByCategory filters by category', () async {
    final filtered = await UpcyclingService.loadTutorialImagesByCategory('plastic');
    expect(filtered.length, 1);
    expect(filtered[0].key, 'assets/images/tutorial1.png');
  });

  test('loadTutorialImagesByCategory returns all for "all" category', () async {
    expect((await UpcyclingService.loadTutorialImagesByCategory('all')).length, 2);
  });
}
