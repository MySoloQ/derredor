import 'package:derredor/pages/favoritos_page.dart';
import 'package:derredor/pages/paginaTeste.dart';
import 'package:flutter/material.dart';
import 'package:derredor/pages/InitialPage.dart';
import 'package:derredor/pages/register_page.dart';

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
        'paginaTeste': (context) => const Paginateste(),
        'registerPage': (context) => Registerpage(),
        'favoritosPage': (context) => FavoritosPage(),
      },
    );
  }
}
