import 'package:chrckin/base/store.dart';
import 'package:chrckin/feature/home/view/homepage.dart';
import 'package:chrckin/feature/login/view/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Checkin',
      home: Store.token == false
          ? Login()
          : Homepage(
              isChecked: false,
            ),
    );
  }
}
