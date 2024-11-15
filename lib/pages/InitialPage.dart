import 'package:flutter/material.dart';
import 'package:derredor/style/style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class Initialpage extends StatefulWidget {
  const Initialpage({super.key});

  @override
  State<Initialpage> createState() => _InitialpageState();
}

class _InitialpageState extends State<Initialpage> {

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
                    duration: Duration(milliseconds: 3000),
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
                      return SizedBox();
                    },
                    options: CarouselOptions(
                      height: height * .3,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(milliseconds: 10000),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  // Container(
                  //   height: height / 2,
                  //   child: CarouselSlider(
                  //     options: CarouselOptions(height: height/2,
                  //         aspectRatio: 16/9,
                  //       viewportFraction: 1.0,
                  //       enableInfiniteScroll: true,
                  //       autoPlay: true,
                  //       autoPlayInterval: Duration(milliseconds: 5000),
                  //       autoPlayAnimationDuration: Duration(milliseconds: 800),
                  //       autoPlayCurve: Curves.linearToEaseOut,
                  //       enlargeCenterPage: false,
                  //     ),
                  //     items: [
                  //       Container(
                  //         decoration: BoxDecoration(
                  //           image: DecorationImage(
                  //               image: AssetImage('assets/fervedouro_bela_vista_1.png',),
                  //           fit: BoxFit.cover)
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
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
                            textStyle: TextStyle(
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
                          decoration: BoxDecoration(
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
                            Navigator.pushNamed(context, 'paginaTeste');
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
                                WidgetStatePropertyAll<Size>(Size(300, 50)),
                          ),
                          child: Text(
                            'Já possuo cadastro',
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    color: StyleApp.detailsWhite1,
                                    letterSpacing: .5,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 45, 0, 0),
                          child: SizedBox(
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform.translate(
                                      offset: Offset(-30, 0),
                                      child: ClipRect(
                                        child: Container(
                                          width: 130,
                                          height: 2,
                                          color: Color(0xE3E3E3FF),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'OU',
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Transform.translate(
                                      offset: Offset(30, 0),
                                      child: ClipRect(
                                        child: Container(
                                          width: 130,
                                          height: 2,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(0.01),
                                              color: Color(0xE3E3E3FF)),
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
                            child: Text(
                              'Desejo me cadastrar',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      letterSpacing: .5,
                                      fontWeight: FontWeight.w500)),
                            ),
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
                                  WidgetStatePropertyAll<Size>(Size(300, 50)),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, 'registerPage');
                            },
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

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintLago = Paint()
      ..color = StyleApp.detailsLago1
      ..style = PaintingStyle.fill;

    final paintDunas = Paint()
      ..color = StyleApp.bgColor
      ..style = PaintingStyle.fill;

    final paintPorSol = Paint()
      ..color = StyleApp.detailsColor_2
      ..style = PaintingStyle.fill;

    final pathPorSol = Path();
    pathPorSol.moveTo(0, size.height * .4);
    pathPorSol.cubicTo(size.width * .24, size.height * .35, size.width * .8,
        size.height * .55, size.width, size.height * 0.43);
    pathPorSol.cubicTo(size.width * 40, size.height, size.width + 20,
        size.height, 0, size.height);
    pathPorSol.close();

    canvas.drawPath(pathPorSol, paintPorSol);

    final pathLago = Path();
    pathLago.moveTo(0, size.height * .5);
    pathLago.cubicTo(size.width * .24, size.height * .4, size.width * .8,
        size.height * .6, size.width, size.height * 0.4);
    pathLago.cubicTo(size.width * 30, size.height, size.width + 1, size.height,
        0, size.height);
    pathLago.close();

    canvas.drawPath(pathLago, paintLago);

    final pathDunas = Path();
    pathDunas.moveTo(0, size.height * .5);
    pathDunas.cubicTo(size.width * .24, size.height * .4, size.width * .8,
        size.height * .7, size.width, size.height * 0.4);
    pathDunas.cubicTo(size.width * 32, size.height, size.width + 15,
        size.height, 0, size.height);
    pathDunas.close();

    canvas.drawPath(pathDunas, paintDunas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
