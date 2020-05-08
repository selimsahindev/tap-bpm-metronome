import 'package:flutter/material.dart';
import 'package:bpmcounter/home_page.dart';
import 'package:bpmcounter/constants.dart';

void main() => runApp(BpmCounter());

class BpmCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
      ),
      home: HomePage(),
    );
  }
}
