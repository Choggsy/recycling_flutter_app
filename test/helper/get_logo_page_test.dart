import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/helper/get_logo_page.dart';
import 'package:recycling_flutter_app/view/guideline/logo/fair_trade_environment_logo_page.dart';
import 'package:recycling_flutter_app/view/guideline/logo/recycling_logo_page.dart';
import 'package:recycling_flutter_app/view/guideline/logo/non_regulate_logo_page.dart';

void main() {
  test('getLogoPage returns RecyclableLogoPage for index 0', () {
    expect(getLogoPage(0), isA<RecyclableLogoPage>());
  });

  test('getLogoPage returns FairTradeEnvironmentalLogoPage for index 1', () {
    expect(getLogoPage(1), isA<FairTradeEnvironmentalLogoPage>());
  });

  test('getLogoPage returns NonRegulatedLogoPage for index 2', () {
    expect(getLogoPage(2), isA<NonRegulatedLogoPage>());
  });

  for (var index in [3, 999, -1]) {
    test('getLogoPage returns RecyclableLogoPage for outOfBounds index $index', () {
      expect(getLogoPage(index), isA<RecyclableLogoPage>());
    });
  }
}
