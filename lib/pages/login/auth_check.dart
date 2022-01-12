import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/home/index.dart';
import 'package:find_a_book/pages/login/login.dart';
import 'package:find_a_book/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return Login();
    } else {
      return HomePage();
    }
  }

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Cores.verdeAgua,
        ),
      ),
    );
  }
}
