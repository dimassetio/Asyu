import 'package:intl/intl.dart';
import 'jadwal_model.dart';

class JamModel {
  final JadwalModel jadwal = JadwalModel();
  var now = DateTime.now();
  var formatted = new DateFormat('EEE, dd MMM yyyy');
  var formattedHour = new DateFormat('hh : mm : ss');
  var selectedDate;

  currentTime() {
    return formattedHour.format(DateTime.now());
  }

  currentDate() {
    return formatted.format(DateTime.now());
  }

  double lat = -7.983908;
  double long = 112.621391;
  updateDate(DateTime date) {
    jadwal.getPrayerTimes(lat, long, date);
    return selectedDate = formatted.format(date);
  }
}
