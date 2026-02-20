import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String toMonthPT() {
    switch (month) {
      case 1:
        return "Janeiro";
      case 2:
        return "Fevereiro";
      case 3:
        return "Março";
      case 4:
        return "Abril";
      case 5:
        return "Maio";
      case 6:
        return "Junho";
      case 7:
        return "Julho";
      case 8:
        return "Agosto";
      case 9:
        return "Setembro";
      case 10:
        return "Outubro";
      case 11:
        return "Novembro";
      case 12:
        return "Dezembro";
      default:
        throw "Invalid month number";
    }
  }

  DateTime onlyDay() {
    return DateTime(year, month, day);
  }

  String formatDatePT() {
    String strDay = day < 10 ? '0$day' : day.toString();

    return "$strDay ${abbreviateMonthPT()} $year";
  }

  String abbreviateMonthPT() {
    const abbreviations = [
      "Jan",
      "Fev",
      "Mar",
      "Abr",
      "Mai",
      "Jun",
      "Jul",
      "Ago",
      "Set",
      "Out",
      "Nov",
      "Dez",
    ];

    if (month < 1 || month > 12) {
      throw ArgumentError("Invalid month: Value only between 1 and 12");
    }

    return abbreviations[month - 1];
  }

  static String formatDate(String iso, String format) {
    DateTime data = DateTime.parse(iso);
    return DateFormat(format).format(data);
  }

  static getMonthLabel(month) {
    switch (month) {
      case 1:
        return "Janeiro";
      case 2:
        return "Fevereiro";
      case 3:
        return "Março";
      case 4:
        return "Abril";
      case 5:
        return "Maio";
      case 6:
        return "Junho";
      case 7:
        return "Julho";
      case 8:
        return "Agosto";
      case 9:
        return "Setembro";
      case 10:
        return "Outubro";
      case 11:
        return "Novembro";
      case 12:
        return "Dezembro";
      default:
        throw "Invalid month number";
    }
  }

  static bool isCurrentMonthEqualToIso(String isoDate) {
    final now = DateTime.now();
    final date = DateTime.parse(isoDate);
    return now.month == date.month && now.year == date.year;
  }
}
