import 'package:derredor/pages/RegisterPage.dart';
import 'package:derredor/pages/SplashScreen.dart';
import 'package:derredor/pages/paginaTeste.dart';
import 'package:flutter/material.dart';
import 'package:derredor/pages/InitialPage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Splashscreen(),
        'initialPage': (context) => const Initialpage(),
        'paginaTeste': (context) => const Paginateste(),
        'registerPage': (context) => const Registerpage(),
      },
    );
  }
}
