import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recycling_flutter_app/helper/space_helper.dart';

void main() {
  test('Space.small returns SizedBox with height 10.0', () {
    expect(Space.small.box, isA<SizedBox>());
    expect((Space.small.box).height, 10.0);
  });

  test('Space.medium returns SizedBox with height 20.0', () {
    expect(Space.medium.box, isA<SizedBox>());
    expect((Space.medium.box).height, 20.0);
  });

  test('Space.large returns SizedBox with height 30.0', () {
    expect(Space.large.box, isA<SizedBox>());
    expect((Space.large.box).height, 30.0);
  });
}
