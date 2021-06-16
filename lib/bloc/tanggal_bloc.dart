import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:iling_adzan/models/jadwal_model.dart';

final JadwalModel jadwal = JadwalModel();
final double lat = -7.983908;
final double long = 112.621391;

class TanggalBloc extends Bloc<String, String> {
  var formatted = DateFormat('EEE, dd MM yyyy');
  var currentDate = DateTime.now();
  var waktu;
  TanggalBloc(String initialState) : super(initialState);

  @override
  Stream<String> mapEventToState(event) async* {
    if (event == 'add') {
      currentDate = currentDate.add(const Duration(days: 1));
      jadwal.getPrayerTimes(lat, long, currentDate);
    } else if (event == 'remove') {
      currentDate = currentDate.add(const Duration(days: -1));
      waktu = jadwal.getPrayerTimes(lat, long, currentDate);
    } else if (event == 'reset') {
      currentDate = DateTime.now();
    }
    yield formatted.format(currentDate);
  }
}
