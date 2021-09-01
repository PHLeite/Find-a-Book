import 'package:find_a_book/pages/home/index.dart';
import 'package:find_a_book/pages/login/login.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FaB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}