import 'package:flutter/material.dart';
import 'package:derredor/style/style.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Initialpage extends StatefulWidget {
  const Initialpage({super.key});

  @override
  State<Initialpage> createState() => _InitialpageState();
}

class _InitialpageState extends State<Initialpage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool _isPressed = false;

    void _toggleButton() {
      setState(() {
        _isPressed = !_isPressed;
      });
    }

    return Scaffold(

      body: Column(
              children: [
      Expanded(
        child: Container(
            height: height / 2,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: height / 2,
                  child: CarouselSlider(
                    options: CarouselOptions(height: height/2,
                        aspectRatio: 16/9,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(milliseconds: 5000),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.linearToEaseOut,
                      enlargeCenterPage: false,
                    ),
                    items: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/fervedouro_bela_vista_1.png',),
                          fit: BoxFit.cover)
                        ),
                      )
                    ],
                  ),
                ),
                CustomPaint(
                  size: Size(width, height),
                  painter: Painter(),
                ),
                Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/icons/icon_sol_tocantins.png',
                    ),
                  ),
                ))
              ],
            )),
      ),
      Expanded(
        child: Container(
          height: 500,
          color: StyleApp.bgColor,
          child: Column(
            children: [
              Text(
                'Escolha como deseja acessar o app',
                style: TextStyle(color: Colors.black45, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      color: _isPressed
                          ? Colors.greenAccent
                          : Colors.red,
                      borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                    child: Text(
                      'Já possuo cadastro',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: _toggleButton,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                          Text('OU'),
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
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                      color: _isPressed
                          ? Colors.greenAccent
                          : Colors.red,
                      borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                    child: Text(
                      'Desejo me cadastrar',
                      style: TextStyle(fontSize: 20, color: Colors.black45),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side:
                                BorderSide(color: Colors.black, width: 2)),
                        minimumSize: Size(300, 50),
                        backgroundColor: Colors.white),
                    onPressed: _toggleButton,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
              ],
            ),
    );
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = StyleApp.bgColor
      ..style = PaintingStyle.fill;

    final pathBottom = Path();
    pathBottom.moveTo(0, size.height);
    pathBottom.cubicTo(size.width * .24, size.height * .60, size.width * .60,
        size.height * .8, size.width, size.height * 0.60);
    pathBottom.cubicTo(size.width, size.height * .15, size.width, size.height,
        size.width, size.height);
    pathBottom.close();

    canvas.drawPath(pathBottom, paint);

    final pathTop = Path();
    pathTop.moveTo(0, size.height * 0.24);
    pathTop.cubicTo(size.width * .24, size.height * .001, size.width * .60,
        size.height * .20, size.width, size.height * 0.001);
    pathTop.cubicTo(size.width, -size.height * .15, -size.width, -size.height,
        -size.width, -size.height);
    pathTop.close();

    canvas.drawPath(pathTop, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
