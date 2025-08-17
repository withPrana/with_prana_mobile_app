import 'package:intl/intl.dart';

class DateFormatter {
  ////dd/mm/yyyy
  static String formatDate(String? date) {
    DateTime fetchedDate;
    if (date != null && date.isNotEmpty) {
      try {
        fetchedDate = DateTime.parse(date.toString()).toLocal();
      } catch (e) {
        return date;
      }
      final formattedDate = DateFormat("dd/MM/yyyy").format(fetchedDate);
      return formattedDate;
    } else {
      return '';
    }
  }

  ////dd mm name yyyy
  static String formatDateWitMonthName(String? date) {
    DateTime fetchedDate;
    if (date != null && date.isNotEmpty) {
      try {
        fetchedDate = DateTime.parse(date.toString()).toLocal();
      } catch (e) {
        return date;
      }
      final formattedDate = DateFormat('d MMMM yyyy').format(fetchedDate);

      return formattedDate;
    } else {
      return '';
    }
  }

  ////hh:mm am/pm
  static String formatTime(String? date) {
    DateTime fetchedDate;
    if (date != null && date.isNotEmpty) {
      try {
        fetchedDate = DateTime.parse(date.toString()).toLocal();
      } catch (e) {
        return date;
      }
      final formattedDate = DateFormat('hh:mm a').format(fetchedDate);
      return formattedDate;
    } else {
      return '';
    }
  }
}
