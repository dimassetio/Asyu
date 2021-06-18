import '../controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tanggal extends StatelessWidget {
  final homeC = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  homeC.prevDay().then((value) => homeC.getPrayerTimes());
                },
                icon: Icon(Icons.arrow_left, size: 30, color: Colors.white)),
            TextButton(
              child: Text(
                homeC.tanggal.formatted.value,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                homeC.currentDay().then((value) => homeC.getPrayerTimes());
              },
            ),
            IconButton(
                onPressed: () {
                  homeC.nextDay().then((value) => homeC.getPrayerTimes());
                },
                icon: Icon(Icons.arrow_right, size: 30, color: Colors.white)),
          ],
        ));
  }
}
