import '../controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Jam extends StatelessWidget {
  final homeC = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          child: Text(
            homeC.jam.now.value.toString(),
            style: TextStyle(color: Colors.white, fontSize: 48),
          ),
        ));
  }
}
