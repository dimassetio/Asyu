import '../controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Locator extends StatelessWidget {
  final homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextButton(
        onPressed: () {
          homeC.getLocation().then((value) => homeC.getPrayerTimes());
        },
        style:
            TextButton.styleFrom(primary: Colors.green, shape: CircleBorder()),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Icon(Icons.pin_drop),
          Text(
            homeC.locator.address.value,
            style: TextStyle(fontSize: 16),
          ),
        ])));
  }
}
