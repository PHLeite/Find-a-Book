import 'package:find_a_book/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService()),
    ],
    child: MyApp(),
  ));
}
