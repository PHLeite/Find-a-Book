import 'package:find_a_book/pages/login/auth_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FaB',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: FutureBuilder(
            future: _fbApp,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('You hava an error! ${snapshot.error.toString()}');
                return Text('Algo inesperado aconteceu!');
              } else if (snapshot.hasData) {
                return AuthCheck();
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
