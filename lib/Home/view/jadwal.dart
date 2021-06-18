import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iling_adzan/Home/controller/home_controller.dart';

class Jadwal extends StatelessWidget {
  // final homeC = Get.put(HomeController());
  final homeC = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: homeC.jadwal.namaSholat.length,
            itemBuilder: (context, index) {
              return Obx(() => Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: Text(homeC.jadwal.namaSholat[index],
                            style: TextStyle(
                              fontSize: 18,
                              // color: Colors.green[900],
                            )),
                      ),
                      Container(
                        width: 100,
                        child: Text(
                          homeC.jadwal.waktuSholat[index],
                          style: TextStyle(
                              // color: Colors.green[900],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            launchNotif(index, homeC.jadwal.namaSholat[index],
                                homeC.jadwal.waktuSholat[index]);
                          },
                          icon: Icon(Icons.alarm_add))
                    ],
                  )));
            }));
  }
}
