import 'package:flutter/material.dart';
import 'package:iling_adzan/models/jadwal_model.dart';

class Jadwal extends StatefulWidget {
  @override
  _JadwalState createState() => _JadwalState();
}

class _JadwalState extends State<Jadwal> {
  final JadwalModel jadwal = JadwalModel();

  var date = DateTime.now();
  final double lat = -7.983908;
  final double long = 112.621391;

  @override
  void initState() {
    super.initState();
    jadwal.getPrayerTimes(lat, long, date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: jadwal.namaSholat.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 100,
                        child: Text(jadwal.namaSholat[index],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.green[900],
                            )),
                      ),
                      Container(
                        width: 100,
                        child: Text(
                          jadwal.waktuSholat[index],
                          style: TextStyle(
                              color: Colors.green[900],
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.alarm_add))
                    ],
                  ));
            }));
  }
}
