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
  TestWidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter test binding is initialized

  const mockJson = '''
  {
    "upcycling_tutorials": [
      {
        "title": "Wine Cork Key Holder",
        "categories": ["utility"]
      },
      {
        "title": "CD Mosaic Coasters",
        "categories": ["craft"]
      },
      {
        "title": "Plastic Bottle Drip Irrigation",
        "categories": ["garden"]
      },
      {
        "title": "Old Drawer to Wall Shelf",
        "categories": ["repurpose"]
      },
      {
        "title": "Tin Can Lanterns",
        "categories": ["craft", "garden", "repurpose"]
      },
      {
        "title": "Old T-Shirt Tote Bag",
        "categories": ["craft", "utility", "repurpose"]
      },
      {
        "title": "Pallet Garden Planter",
        "categories": ["garden", "utility", "repurpose"]
      },
      {
        "title": "Glass Jar Herb Garden",
        "categories": ["garden", "utility", "repurpose"]
      },
      {
        "title": "Denim Pocket Organizer",
        "categories": ["utility", "repurpose"]
      },
      {
        "title": "Old Books to Floating Shelves",
        "categories": ["repurpose"]
      },
      {
        "title": "Bottle Cap Magnets",
        "categories": ["craft", "repurpose"]
      },
      {
        "title": "Old Sweater Pillow Covers",
        "categories": ["craft", "repurpose"]
      },
      {
        "title": "Egg Carton Seed Starters",
        "categories": ["garden"]
      },
      {
        "title": "Ladder Bookshelf",
        "categories": ["repurpose", "utility"]
      },
      {
        "title": "Cereal Box Desk Organizer",
        "categories": ["utility", "craft", "repurpose"]
      }
    ]
  }
  ''';

  late AssetBundle mockBundle;

  setUp(() {
    mockBundle = MockAssetBundle(mockJson);
  });

  test('Loads all tutorials when category is "all"', () async {
    final tutorials = await UpcyclingService.loadTutorialTitlesByCategory('all');

    expect(tutorials.length, 15);
    expect(tutorials[0].key, 'Wine Cork Key Holder');
    expect(tutorials[1].key, 'CD Mosaic Coasters');
    expect(tutorials[2].key, 'Plastic Bottle Drip Irrigation');
  });

  test('Filters tutorials by "craft" category', () async {
    final tutorials = await UpcyclingService.loadTutorialTitlesByCategory('craft');

    expect(tutorials.length, 6);
    expect(tutorials[0].key, 'CD Mosaic Coasters');
    expect(tutorials[1].key, 'Tin Can Lanterns');
    expect(tutorials[2].key, 'Old T-Shirt Tote Bag');
  });

  test('Filters tutorials by "garden" category', () async {
    final tutorials = await UpcyclingService.loadTutorialTitlesByCategory('garden');

    expect(tutorials.length, 5);
    expect(tutorials[0].key, 'Plastic Bottle Drip Irrigation');
    expect(tutorials[1].key, 'Tin Can Lanterns');
    expect(tutorials[2].key, 'Pallet Garden Planter');
  });

  test('Filters tutorials by "repurpose" category', () async {
    final tutorials = await UpcyclingService.loadTutorialTitlesByCategory('repurpose');

    expect(tutorials.length, 11);
    expect(tutorials[0].key, 'Old Drawer to Wall Shelf');
    expect(tutorials[1].key, 'Tin Can Lanterns');
    expect(tutorials[2].key, 'Old T-Shirt Tote Bag');
  });

  test('Filters tutorials by "utility" category', () async {
    final tutorials = await UpcyclingService.loadTutorialTitlesByCategory('utility');

    expect(tutorials.length, 7);
    expect(tutorials[0].key, 'Wine Cork Key Holder');
    expect(tutorials[1].key, 'Old T-Shirt Tote Bag');
    expect(tutorials[2].key, 'Pallet Garden Planter');
  });

  test('Returns an empty list if category is not found', () async {
    final tutorials = await UpcyclingService.loadTutorialTitlesByCategory('nonexistent');
    expect(tutorials.length, 0);
  });
}