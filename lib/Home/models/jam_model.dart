import 'package:get/get.dart';
import 'package:intl/intl.dart';

class JamModel {
  final now = DateFormat('hh : mm : ss').format(DateTime.now()).obs;
  var formatHour = DateFormat('hh : mm : ss');
}
