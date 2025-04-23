import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/helper/get_page.dart' show getPage;
import 'package:recycling_flutter_app/view/guideline/guidelines_page.dart'
    show GuidelinesPage;
import 'package:recycling_flutter_app/view/home_page.dart' show HomePage;
import 'package:recycling_flutter_app/view/upcycle_page.dart' show UpcyclePage;

void main() {
  test('getPage returns correct widget for index 0', () {
    expect(getPage(0), isA<UpcyclePage>());
  });

  test('getPage returns correct widget for index 1', () {
    expect(getPage(1), isA<HomePage>());
  });

  test('getPage returns correct widget for index 2', () {
    expect(getPage(2), isA<GuidelinesPage>());
  });

  test('getPage returns HomePage for invalid index', () {
    expect(getPage(999), isA<HomePage>());
  });
}
