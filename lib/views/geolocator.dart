import 'package:flutter/material.dart';
import 'package:iling_adzan/models/locator_model.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final LocatorModel locator = LocatorModel();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(primary: Colors.white),
      onPressed: () {
        locator.getLocation().then((value) {
          setState(() {});
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.pin_drop_outlined),
          Text(locator.address ?? 'default (Malang)'),
        ],
      ),
    );
  }
}
