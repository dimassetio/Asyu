import 'dart:async';
// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iling_adzan/alarm_manager.dart';
import 'package:iling_adzan/bloc/tanggal_bloc.dart';
import 'package:iling_adzan/views/tanggal.dart';
import 'package:intl/intl.dart';

import 'views/jam.dart';
import 'views/jadwal_sholat.dart';
import 'views/geolocator.dart';

import 'views/tanggal.dart';

import 'package:iling_adzan/audio_player.dart';

import 'package:audio_service/audio_service.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String today = DateFormat('EEE, dd MM yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TanggalBloc(today),
        child: Scaffold(
          body: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [Colors.green, Colors.lightGreen],
                      end: Alignment.bottomCenter)),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Jam(),
                  Tanggal(),
                  Jadwal(),
                  Location(),
                  Audio(),
                  Alarm()
                ])
          ]),
        ),
      ),
    );
  }
}
