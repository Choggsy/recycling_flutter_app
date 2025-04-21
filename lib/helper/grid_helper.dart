class GridHelper {
  static int getCrossAxisCellCount(final int index) {
    switch (index) {
      case 0:
        return 2;
      case 1:
        return 2;
      case 2:
      case 3:
        return 1;
      case 4:
        return 4;
      default:
        return 1;
    }
  }

  static int getMainAxisCellCount(final int index) {
    switch (index) {
      case 0:
        return 2;
      case 1:
      case 2:
      case 3:
        return 1;
      case 4:
        return 2;
      default:
        return 1;
    }
  }
}
