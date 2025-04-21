import 'package:flutter/cupertino.dart' show SizedBox;

enum Space {
  small,
  medium,
  large,
}

extension SpaceExtension on Space {
  SizedBox get box {
    switch (this) {
      case Space.small:
        return SizedBox(height: 10.0);
      case Space.medium:
        return SizedBox(height: 20.0);
      case Space.large:
        return SizedBox(height: 30.0);
      }
  }
}
