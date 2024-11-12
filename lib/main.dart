import 'package:derredor/pages/RegisterPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'registerPage',
      routes: {
        'registerPage': (context) => Registerpage(),
      },
    );
  }
}
