import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  return DateFormat('EEEE, d MMM yyyy').format(dateTime);
}