import 'package:derredor/pages/FavoritosPage.dart';
import 'package:flutter/material.dart';
import 'package:derredor/pages/InitialPage.dart';
import 'package:derredor/pages/RegisterPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'initialPage',
      routes: {
        'initialPage': (context) => const Initialpage(),
        'registerPage': (context) => Registerpage(),
        'favoritosPage': (context) => FavoritosPage(),
      },
    );
  }
}
