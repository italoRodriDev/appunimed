extension CoinsExtensions on int {
  static String resumeCoins({required int coins}) {
    double value;
    String formatted;

    if (coins >= 1000000000) {
      value = coins / 1000000000;
      formatted = _trim(value) + 'B';
    } else if (coins >= 1000000) {
      value = coins / 1000000;
      formatted = _trim(value) + 'M';
    } else if (coins >= 1000) {
      value = coins / 1000;
      formatted = _trim(value) + 'K';
    } else {
      return coins.toString();
    }

    return formatted;
  }

  static String _trim(double v) {
    final s = v.toStringAsFixed(1);
    return s.endsWith('.0') ? s.substring(0, s.length - 2) : s;
  }
}
