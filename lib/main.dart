import 'package:flutter/material.dart';
import 'package:derredor/api/app_variables_db.dart';
import 'package:provider/provider.dart';
import 'package:derredor/pages/login_page.dart';
import 'package:derredor/pages/InitialPage.dart';
import 'package:derredor/pages/register_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppVariablesDb(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'initialPage',
      routes: {
        '/LoginScreen': (context) => const LoginScreen(),
        'initialPage': (context) => const Initialpage(),
        'registerPage': (context) => Registerpage(),
      },
    );
  }
}
