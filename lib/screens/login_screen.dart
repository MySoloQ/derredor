import 'package:carousel_slider/carousel_slider.dart';
import 'package:derredor/api/app_variables_db.dart';
import 'package:derredor/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ShapePathPainter customShape = ShapePathPainter();
  final _loginKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> listOfimages = [
      Image.asset('assets/jalapao.png', fit: BoxFit.cover),
      Image.asset('assets/natividade.png', fit: BoxFit.cover),
      Image.asset('assets/praça_girassois.png', fit: BoxFit.cover),
    ];

    Size size = Provider.of<AppVariablesDb>(context, listen: false)
        .screen
        .screenSize(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Transform.translate(
                  offset: Offset(0, 0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 450,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayCurve: Curves.linearToEaseOut,
                      enlargeCenterPage: false,
                    ),
                    items: listOfimages,
                  ),
                ),
                CustomPaint(
                  size: size,
                  painter: ShapePathPainter(),
                ),
                Transform.translate(
                  offset: Offset(5, size.height * 0.95),
                  child: SizedBox(
                    width: 350,
                    child: Form(
                      key: _loginKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: loginFormField(
                                  'Your email', 'Enter your email'),
                              style: TextStyle(color: StyleApp.textColors),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please, enter a email.';
                                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
                                  return 'Please, enter a valid email.';
                                }
                                return null;
                              },
                              obscureText: false,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              decoration: loginFormField(
                                  'Your password', 'Enter your password'),
                              style: TextStyle(color: StyleApp.textColors),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please, enter a password.';
                                } else if (value.length < 8) {
                                  return 'Please, enter a passoword with more than 8 characters.';
                                }
                                return null;
                              },
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                '',
                                style: TextStyle(color: StyleApp.textColors),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_loginKey.currentState!.validate()) {
                                  Navigator.popAndPushNamed(
                                      context, '/CatalogueScreen');
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
