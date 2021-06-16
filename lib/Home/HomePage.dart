import './controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './view/jam.dart';
import './view/tanggal.dart';
import './view/locator.dart';
import './view/jadwal.dart';

class HomePage extends StatelessWidget {
  final homeC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [Colors.green, Colors.lightGreen],
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Jam(),
                  Tanggal(),
                ],
              ),
            ),
            Jadwal(),
            Locator()
          ],
        ),
      ),
    );
  }
}
