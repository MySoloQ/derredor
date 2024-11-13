import 'package:flutter/material.dart';
import 'package:derredor/api/app_variables_db.dart';
import 'package:derredor/functions.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppVariablesDb(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    bool loggIn = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: verifyLogin(loggIn),
      routes: {
        '/LoginScreen': (context) => const LoginScreen(),
      },
    );
  }
}
