import 'package:get/get.dart';

class JadwalModel {
  List<String> prayerTimes = [];
  RxList<String> waktuSholat =
      ['-- : --', '-- : --', '-- : --', '-- : --', '-- : --'].obs;
  List<String> namaSholat = ['Subuh', 'Dzuhur', 'Ashar', 'Maghrib', 'Isya'];
}
