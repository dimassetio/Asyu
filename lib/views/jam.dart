import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:iling_adzan/models/jam_model.dart';

class Jam extends StatefulWidget {
  @override
  _JamState createState() => _JamState();
}

class _JamState extends State<Jam> {
  final JamModel jam = JamModel();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer timer) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      alignment: Alignment.center,
      child: Text(
        jam.currentTime(),
        style: TextStyle(color: Colors.white, fontSize: 48),
      ),
    );
  }
}
