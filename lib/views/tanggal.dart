import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:iling_adzan/bloc/tanggal_bloc.dart';

class Tanggal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<TanggalBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
            onPressed: () {
              bloc.add('remove');
            },
            icon: Icon(Icons.arrow_left, size: 30, color: Colors.white)),
        BlocBuilder<TanggalBloc, String>(
            builder: (context, state) => TextButton(
                  child: Text(
                    state,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    bloc.add('reset');
                  },
                )),
        IconButton(
            onPressed: () {
              bloc.add('add');
            },
            icon: Icon(Icons.arrow_right, size: 30, color: Colors.white)),
      ],
    );
  }
}
