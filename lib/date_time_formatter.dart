import 'package:intl/intl.dart';

class CustomeDateTimeFormatter {
  /// Convert raw string (ISO or custom) into DateTime
  static DateTime parse(String dateString) {
    return DateTime.parse(dateString).toLocal();
  }

  /// Format to dd/MM/yyyy (e.g. 05/08/2025)
  static String ddMMyyyy(String dateString) {
    final date = parse(dateString);
    return DateFormat("dd/MM/yyyy").format(date);
  }

  /// Format to dd-MM-yyyy (e.g. 05-08-2025)
  static String ddMMyyyyDash(String dateString) {
    final date = parse(dateString);
    return DateFormat("dd-MM-yyyy").format(date);
  }

  /// Format to yyyy-MM-dd (e.g. 2025-08-05)
  static String yyyyMMdd(String dateString) {
    final date = parse(dateString);
    return DateFormat("yyyy-MM-dd").format(date);
  }

  /// Format to dd/MM/yyyy hh:mm a (e.g. 05/08/2025 12:58 PM)
  static String ddMMyyyyhhmma(String dateString) {
    final date = parse(dateString);
    return DateFormat("dd/MM/yyyy hh:mm a").format(date);
  }

  /// Format to dd MMM yyyy (e.g. 05 Aug 2025)
  static String ddMMMyyyy(String dateString) {
    final date = parse(dateString);
    return DateFormat("dd MMM yyyy").format(date);
  }

  /// Format to MMM dd, yyyy (e.g. Aug 05, 2025)
  static String mmmddyyyy(String dateString) {
    final date = parse(dateString);
    return DateFormat("MMM dd, yyyy").format(date);
  }

  /// Format to full date with time (e.g. Tuesday, Aug 05, 2025 12:58 PM)
  static String fullDateTime(String dateString) {
    final date = parse(dateString);
    return DateFormat("EEEE, MMM dd, yyyy hh:mm a").format(date);
  }

  /// Format to only time (e.g. 12:58 PM)
  static String onlyTime(String dateString) {
    final date = parse(dateString);
    return DateFormat("hh:mm a").format(date);
  }

  /// Format date with Today / Yesterday / Tomorrow fallback
  static String relativeDate(String dateString, {String format = "dd/MM/yyyy"}) {
    final date = parse(dateString);
    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));

    final target = DateTime(date.year, date.month, date.day);

    if (target == today) return "Today";
    if (target == yesterday) return "Yesterday";
    if (target == tomorrow) return "Tomorrow";

    // fallback to default format
    return DateFormat(format).format(date);
  }
}
