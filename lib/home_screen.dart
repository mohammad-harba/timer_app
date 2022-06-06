import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Duration duration = Duration();
  var counter = 0;
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() {
    Timer.periodic(const Duration(seconds: 1), ((timer) {
      counter += 1;
      duration = Duration(seconds: counter);
      setState(() {});
    }));
  }

  @override
  Widget build(BuildContext context) {
    final days = twoDigits(duration.inDays);
    final hours = twoDigits(duration.inHours.remainder(24));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'days : hours : mins : secs',
              style: Theme.of(context).textTheme.headline5,
            ),
            const Divider(
              height: 50,
            ),
            Text(
              "$days : $hours : $minutes : $seconds",
              //'$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
