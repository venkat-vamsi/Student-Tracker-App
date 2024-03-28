import 'package:attendance_app/excel.dart';
import 'package:flutter/material.dart';

class iot_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bluetooth Scanner Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: excel(),
    );
  }
}
