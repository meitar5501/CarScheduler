import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Schedule extends StatefulWidget {

  @override
  _ScheduleState createState() => _ScheduleState();

}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("Schedule"),
    );
  }
}
