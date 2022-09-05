enum HealthType {
  UNSELECTED,
  BAD,
  USUALLY,
  GOOD,
}

extension HealthyTypeExtension on HealthType {
  static HealthType getHealthType(int id) {
    switch (id) {
      case -1:
        return HealthType.UNSELECTED;
      case 0:
        return HealthType.BAD;
      case 1:
        return HealthType.USUALLY;
      case 2:
        return HealthType.GOOD;
    }
    return null;
  }

  int get id {
    switch (this) {
      case HealthType.UNSELECTED:
        return -1;
      case HealthType.BAD:
        return 0;
      case HealthType.USUALLY:
        return 1;
      case HealthType.GOOD:
        return 2;
    }
    return null;
  }

  String get title {
    switch (this) {
      case HealthType.UNSELECTED:
        return '未選択';
      case HealthType.BAD:
        return '悪い';
      case HealthType.USUALLY:
        return '普通';
      case HealthType.GOOD:
        return '良い';
    }
    return '';
  }
}
