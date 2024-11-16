import 'package:flutter/material.dart';

class StyleApp {
  static const Color bgColor = Color(0xFFFFD700);
  static const Color detailsLago1 = Color(0xFF007FFF);
  static const Color detailsLago2 = Color(0xFF013976);
  static const Color detailsColor_2 = Color(0xFFFE9600);
  static const Color detailsWhite1 = Colors.white;
  static const Color detailsWhite2 = Color(0xCFCFCFFF);
  static const Color detailsWhite3 = Color(0xCFFF0000);

  static Color buttonsColors = const Color(0xFF007FFF);
  static Color detailsColors = const Color(0xFFFFD700);
  static Color bgColors = const Color(0xFFFFFFFF);
  static Color textColors = Colors.black;
  static Color errorColors = const Color(0xFFDA2C43);
}

InputDecoration loginFormField(String? label, String? hint) {
  return InputDecoration(
    hintText: hint,
    labelText: label,
    hintStyle: TextStyle(color: StyleApp.detailsColors),
    labelStyle: TextStyle(color: StyleApp.detailsColors),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: StyleApp.detailsColors, width: 3),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: StyleApp.detailsColors, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: StyleApp.errorColors, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: StyleApp.errorColors, width: 2),
    ),
  );
}

// Design Tela Inicial
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

// Design Tela de Login
class ShapePathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final pathTop = Path();
    final paint = Paint()
      ..color = StyleApp.buttonsColors
      ..style = PaintingStyle.fill;
    final paintTop = Paint()
      ..color = StyleApp.detailsColors
      ..style = PaintingStyle.fill;

    path.moveTo(0, size.height * .5);
    path.cubicTo(size.width * .24, size.height * .4, size.width * .8,
        size.height * .7, size.width, size.height * 0.5);
    path.cubicTo(size.width, size.height*500, size.width + 1, size.height, 0,
        size.height);
    canvas.drawPath(path, paint);
    path.close();

    pathTop.moveTo(0, size.height * .009);
    pathTop.cubicTo(size.width * .24, size.height * .45, size.width * .8,
        size.height * .0009, size.width, size.height * 0.00009);
    pathTop.cubicTo(-size.width, -size.height * .00009, size.width + 15,
        -size.height, 0, -size.height);
    canvas.drawPath(pathTop, paintTop);

    pathTop.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
