import 'prayer_time.dart';

class JadwalModel {
  List<String> _prayerTimes = [];
  List<String> waktuSholat = [];
  List<String> namaSholat = ['Subuh', 'Dzuhur', 'Ashar', 'Maghrib', 'Isya'];

  getPrayerTimes(double lat, double long, DateTime date) {
    PrayerTime prayers = new PrayerTime();
    prayers.setTimeFormat(prayers.getTime24());
    prayers.setCalcMethod(prayers.getMWL());
    prayers.setAsrJuristic(prayers.getShafii());
    prayers.setAdjustHighLats(prayers.getAdjustHighLats());

    List<int> offsets = [-9, 0, 0, 0, 0, 0, 4];
    prayers.tune(offsets);

    String tz = "${DateTime.now().timeZoneOffset}";
    var timezone = double.parse(tz[0]);

    _prayerTimes = prayers.getPrayerTimes(date, lat, long, timezone);

    return waktuSholat = [
      _prayerTimes[0],
      _prayerTimes[2],
      _prayerTimes[3],
      _prayerTimes[5],
      _prayerTimes[6],
    ];
  }
}
