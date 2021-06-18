import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

import '../models/jam_model.dart';
import '../models/tanggal_model.dart';
import '../models/locator_model.dart';
import '../models/prayer_time.dart';
import '../models/jadwal_model.dart';
import '../models/notification_model.dart';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class HomeController extends GetxController {
  var jam = JamModel();
  var tanggal = TanggalModel();
  var locator = LocatorModel();
  var jadwal = JadwalModel();

  @override
  void onReady() {
    super.onReady();
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        jam.now.value = jam.formatHour.format(DateTime.now());
      },
    );
    getLocation().then((value) => getPrayerTimes());
    notifSetting();
    tz.initializeTimeZones();
  }

// Tanggal
  nextDay() async {
    tanggal.currentDate = tanggal.currentDate.add(Duration(days: 1));
    return tanggal.formatted.value =
        tanggal.formatDate.format(tanggal.currentDate);
  }

  prevDay() async {
    tanggal.currentDate = tanggal.currentDate.add(Duration(days: -1));
    return tanggal.formatted.value =
        tanggal.formatDate.format(tanggal.currentDate);
  }

  currentDay() async {
    tanggal.currentDate = DateTime.now();
    return tanggal.formatted.value =
        tanggal.formatDate.format(tanggal.currentDate);
  }

//Locator
  getLocation() async {
    try {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      locator.lat = position.latitude;
      locator.long = position.longitude;
      update();
      List<Placemark> addresses =
          await placemarkFromCoordinates(locator.lat, locator.long);
      // print(addresses);
      return [
        locator.address.value =
            '${addresses.first.locality}, ${addresses.first.subAdministrativeArea}',
        locator.lat,
        locator.long
      ];
    } on Exception catch (e) {
      return locator.address.value = 'error';
    }
  }

//Jadwal
  getPrayerTimes() {
    try {
      PrayerTime prayers = new PrayerTime();
      prayers.setTimeFormat(prayers.getTime24());
      prayers.setCalcMethod(prayers.getMWL());
      prayers.setAsrJuristic(prayers.getShafii());
      prayers.setAdjustHighLats(prayers.getAdjustHighLats());

      List<int> offsets = [-9, 0, 0, 0, 0, 0, 4];
      prayers.tune(offsets);

      String tz = "${DateTime.now().timeZoneOffset}";
      var timezone = double.parse(tz[0]);
      jadwal.prayerTimes = prayers.getPrayerTimes(
          tanggal.currentDate, locator.lat, locator.long, timezone);

      jadwal.waktuSholat.value = [
        jadwal.prayerTimes[0],
        jadwal.prayerTimes[2],
        jadwal.prayerTimes[3],
        jadwal.prayerTimes[5],
        jadwal.prayerTimes[6],
      ];
      print([
        jadwal.waktuSholat,
        tanggal.currentDate,
        locator.lat,
        locator.long,
        locator.address
      ]);
    } on Exception catch (e) {
      print(e);
    }
  }
}

//Notif
void notifSetting() async {
  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  flutterNotifications.initialize(initializationSettings);
}

parseDate(String hour) {
  var cDate = DateFormat('yyyyMMdd').format(DateTime.now());
  var schedule = DateTime.parse("${cDate} $hour:00");
  tz.TZDateTime.from(schedule, tz.local);
}

Future<void> launchNotif(int id, String title, String hour) async {
  var cDate = DateFormat('yyyyMMdd').format(DateTime.now());
  var schedule = DateTime.parse("${cDate} $hour:00");
  var scheduled = tz.TZDateTime.from(schedule, tz.local);
  flutterNotifications.zonedSchedule(
      id, //id,
      title, //title
      'Sudah Waktunya Adzan $title',
      scheduled,
      // tz.TZDateTime.now(tz.local).add(Duration(seconds: 3)), //scheduledDate,
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true);
}
