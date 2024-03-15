// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: DateAndTime(),
    );
  }
}

class DateAndTime extends StatefulWidget {
  const DateAndTime({super.key});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  String year = "";
  String month = "";
  String day = "";
  String weekDay = "";
  int hour = 0;
  String min = "";
  String sec = "";
  String pmam = "";

  cangeEverySec() {
    Timer t1 = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        //Date
        year = DateTime.now().year.toString();

        month = DateTime.now().month.toString();
        if (month == "1") {
          month = "January";
        } else if (month == "2") {
          month = "February";
        } else if (month == "3") {
          month = "March";
        } else if (month == "4") {
          month = "April";
        } else if (month == "5") {
          month = "May";
        } else if (month == "6") {
          month = "June";
        } else if (month == '7') {
          month = "July";
        } else if (month == '8') {
          month = "August";
        } else if (month == "9") {
          month = "September";
        } else if (month == "10") {
          month = "October";
        } else if (month == "11") {
          month = "November";
        } else if (month == "12") {
          month = "December";
        }
        day = DateTime.now().day.toString();
        weekDay = DateTime.now().weekday.toString();
        switch (weekDay) {
          case "0":
            weekDay = "Sunday ";
            break;
          case "1":
            weekDay = "Monday  ";
            break;
          case "2":
            weekDay = "Tuesday  ";
            break;
          case "3":
            weekDay = "Wednesday  ";
            break;
          case "4":
            weekDay = "Thursday  ";
            break;
          case "5":
            weekDay = "Friday  ";
            break;
          case "6":
            weekDay = "Saturday  ";
            break;
        }
        hour = DateTime.now().hour;
        if (hour >= 12)
          pmam = "PM";
        else
          pmam = "AM";
        if (hour > 12) {
          hour = hour - 12;
        }
        min = DateTime.now().minute.toString();
        sec = DateTime.now().second.toString();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    cangeEverySec();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time & Date App ",
            style: TextStyle(fontSize: 27, color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 57, 73, 80),
      ),
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today Date Is $weekDay",
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              " $month $day, $year",
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "${hour.toString().padLeft(2, "0")}:${min.padLeft(2, "0")}: ${sec.padLeft(2, "0")}  $pmam",
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
