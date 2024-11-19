// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:derredor/style/style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int _currentIndex = 0;

  final List<String> images = [
    'assets/images/backgrounds/initial_page/dunas_jalapao_initial.png',
    'assets/images/backgrounds/initial_page/fervedouro_bela_vista_initial.png',
    'assets/images/backgrounds/initial_page/praca_girassois_initial.png',
    'assets/images/backgrounds/initial_page/fervedouro_initial.png',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
              height: height,
              color: Colors.white,
              child: Stack(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 3000),
                    child: Image.asset(
                      images[_currentIndex],
                      key: ValueKey<int>(_currentIndex),
                      height: height * .65,
                      width: width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index, realIdx) {
                      return const SizedBox();
                    },
                    options: CarouselOptions(
                      height: height * .3,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(milliseconds: 5000),

                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  CustomPaint(
                    size: Size(width, height),
                    painter: Painter(),
                  ),
                  Transform.translate(
                    offset: Offset(0, height * .09),
                    child: Center(
                      child: Text(
                        'Escolha como deseja acessar o app',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -height * .25),
                    child: Center(
                      child: Container(
                          width: width * .50,
                          height: width * .50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/icons/icon_sol_tocantins.png',
                              ),
                            ),
                          )),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, height * .65),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'loginPage');
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.resolveWith((states) {
                              if (states.contains(WidgetState.pressed)) {
                                return StyleApp.detailsLago2;
                              } else {
                                return StyleApp.detailsLago1;
                              }
                            }),
                            minimumSize:
                                const WidgetStatePropertyAll<Size>(Size(300, 50)),
                          ),
                          child: Text(
                            'Já possuo cadastro',
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: StyleApp.detailsWhite1,
                                    letterSpacing: .5,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                          child: SizedBox(
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform.translate(
                                      offset: const Offset(-30, 0),
                                      child: ClipRect(
                                        child: Container(
                                          width: 130,
                                          height: 2,
                                          color: const Color(0xE3E3E3FF),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'OU',
                                      style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Transform.translate(
                                      offset: const Offset(30, 0),
                                      child: ClipRect(
                                        child: Container(
                                          width: 130,
                                          height: 2,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0.01),
                                              color: const Color(0xE3E3E3FF)),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.resolveWith((states) {
                                if (states.contains(WidgetState.pressed)) {
                                  return StyleApp.detailsWhite2;
                                } else {
                                  return Colors.white;
                                }
                              }),
                              minimumSize:
                                  const WidgetStatePropertyAll<Size>(Size(300, 50)),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, 'registerPage');
                            },
                            child: Text(
                              'Desejo me cadastrar',
                              style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
