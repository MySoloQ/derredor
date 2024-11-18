import 'package:derredor/pages/InitialPage.dart';
import 'package:derredor/pages/LoginPage.dart';
import 'package:derredor/pages/RegisterPage.dart';
import 'package:derredor/pages/SplashScreen.dart';
import 'package:derredor/settings/api/app_variables_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(ChangeNotifierProvider(
      create: (context) => AppVariablesDb(), child: const MainApp()));

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
        '/': (context) => const SplashPage(),
        'initialPage': (context) => const InitialPage(),
        'loginPage': (context) => const LoginPage(),
        'registerPage': (context) => const RegisterPage(),
      },
    );
  }
}
