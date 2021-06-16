import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TanggalModel {
  var formatDate = DateFormat('EEE, dd MM yyyy');
  var currentDate = DateTime.now();
  var formatted = DateFormat('EEE, dd MM yyyy').format(DateTime.now()).obs;
}
