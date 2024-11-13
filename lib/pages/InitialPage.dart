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
                Transform.translate(
                  offset: Offset(0, height*.11),
                  child: Center(
                    child: Container(
                      width: width*.50,
                      height: width*.50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/icons/icon_sol_tocantins.png',
                        ),
                      ),
                    )),
                  ),
                )
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
              ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.pressed)) {
                      return Colors.grey[800];
                    } else {
                      return StyleApp.detailsColor;
                    }
                  }
                ),
                    minimumSize: WidgetStatePropertyAll<Size>(Size(300,50)),
                ),
                child: Text(
                  'Já possuo cadastro',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, height * .1, 0, 0),
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
                child: ElevatedButton(
                  child: Text(
                    'Desejo me cadastrar',
                    style: TextStyle(fontSize: 20, color: Colors.black45),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith((states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Colors.grey[800];
                      } else {
                        return Colors.white;
                      }
                    }
                    ),
                    minimumSize: WidgetStatePropertyAll<Size>(Size(300,50)),
                  ),
                  onPressed: _toggleButton,
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

    final paintLago = Paint()
      ..color = StyleApp.detailsColor
      ..style = PaintingStyle.fill;

    final paintDunas = Paint()
      ..color = StyleApp.bgColor
      ..style = PaintingStyle.fill;

    final pathLago = Path();
    pathLago.moveTo(0, size.height * .5);
    pathLago.cubicTo(size.width * .24, size.height * .4, size.width * .60,
        size.height * .60, size.width, size.height * 0.4);
    pathLago.cubicTo(size.width * 30, size.height, size.width+1, size.height,
        0, size.height);
    pathLago.close();

    canvas.drawPath(pathLago, paintLago);

    final pathDunas = Path();
    pathDunas.moveTo(0, size.height * .5);
    pathDunas.cubicTo(size.width * .24, size.height * .4, size.width * .60,
        size.height * .70, size.width, size.height * 0.4);
    pathDunas.cubicTo(size.width * 32, size.height, size.width+15, size.height,
        0, size.height);
    pathDunas.close();

    canvas.drawPath(pathDunas, paintDunas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
