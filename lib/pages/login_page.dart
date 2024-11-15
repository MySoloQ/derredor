// ignore: file_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:derredor/api/app_variables_db.dart';
import 'package:derredor/styles.dart';
import 'package:email_validator/email_validator.dart';
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
  int _currentIndex = 0;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<String> listOfimages = [
    'assets/jalapao.png',
    'assets/natividade.png',
    'assets/praça_girassois.png',
  ];

  @override
  Widget build(BuildContext context) {
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
                  offset: const Offset(0, 0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset(
                      height: size.height,
                      listOfimages[_currentIndex],
                      key: ValueKey<int>(
                          _currentIndex), // Ensures new widget on index change
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                CarouselSlider.builder(
                  itemBuilder: (context, index, realIdx) => Container(),
                  itemCount: listOfimages.length,
                  options: CarouselOptions(
                    height: 550,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
                CustomPaint(
                  size: size,
                  painter: ShapePathPainter(),
                ),
                Transform.translate(
                  offset: Offset(size.width * 0.23, size.height * 0.1),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 25),
                  ),
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
                              controller: _usernameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: loginFormField('Seu nome de usuário',
                                  'Insira seu nome de usuário'),
                              style: TextStyle(color: StyleApp.textColors),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Por favor entre um nome de usuário.';
                                } else if (EmailValidator.validate(
                                    _usernameController.text)) {
                                  return 'Por favor entre um nome de usuário válido.';
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
                              height: 25,
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  if (_loginKey.currentState!.validate()) {
                                    if (await Provider.of<AppVariablesDb>(
                                            context,
                                            listen: false)
                                        .loginProcess
                                        .loginVerification(
                                            _usernameController.text,
                                            _passwordController.text,
                                            context)) {
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Login válido')),
                                      );
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Login inválido')),
                                      );
                                    }
                                  }
                                },
                                child: const Text('Enviar')),
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
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
