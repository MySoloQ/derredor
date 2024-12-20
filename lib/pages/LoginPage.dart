// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../settings/api/app_variables_db.dart';
import '../style/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ShapePathPainter customShape = ShapePathPainter();
  final _loginKey = GlobalKey<FormState>();
  int _currentIndex = 0;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<String> listOfimages = [
    'assets/images/backgrounds/login_page/fervedouro_login.png',
    'assets/images/backgrounds/login_page/natividade_login.png',
    'assets/images/backgrounds/login_page/praca_girassois_login.png',
  ];

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    Size size = Provider.of<AppVariablesDb>(context, listen: false)
        .screen
        .screenSize(context);
    return Scaffold(
      backgroundColor: StyleApp.buttonsColors,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                AnimatedSwitcher(
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(90, 30, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        width: size.width * .50,
                        height: size.width * .50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/icons/icon_sol_tocantins_2.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 450, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Usuário',
                          style: StyleTextLoginScreen.googleRobotoCaption),
                      SizedBox(
                        width: 350,
                        child: Form(
                          key: _loginKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 70,
                                child: TextFormField(
                                  controller: _usernameController,
                                  decoration: loginFormField(
                                      'Insira seu nome de usuário'),
                                  style: StyleTextLoginScreen.googleRobotoText,
                                  autofocus: true,
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
                              ),
                              SizedBox(
                                child: Text('Senha',
                                    style: StyleTextLoginScreen
                                        .googleRobotoCaption),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: SizedBox(
                                  height: 70,
                                  width: 350,
                                  child: TextFormField(
                                    controller: _passwordController,
                                    decoration:
                                        loginFormField('Insira sua senha'),
                                    style:
                                        StyleTextLoginScreen.googleRobotoText,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Por favor, insira sua senha.';
                                      } else if (value.length < 8) {
                                        return 'Por favor, insira sua senha com mais de 8 caracteres.';
                                      }
                                      return null;
                                    },
                                    obscureText: false,
                                  ),
                                ),
                              ),
                              Center(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(largura / 2, 50),
                                      backgroundColor: StyleApp.detailsWhite1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                    ),
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
                                              .showSnackBar(const SnackBar(
                                                  content:
                                                      Text('Login válido')));
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('Login inválido')),
                                          );
                                        }
                                      }
                                    },
                                    child: const Text(
                                      'Enviar',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 17),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                    offset: Offset(size.width * .15, size.height * .90),
                    child: Center(
                      child: Row(
                        children: [
                          const Text(
                            'Não possui cadastro?',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'registerPage');
                            },
                            child: const Text(
                              'CADASTRAR-SE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                decorationThickness: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
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
