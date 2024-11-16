import 'package:flutter/material.dart';

class StyleApp {
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
    path.cubicTo(size.width * 32, size.height, size.width + 1, size.height, 0,
        size.height);
    canvas.drawPath(path, paint);
    path.close();

    pathTop.moveTo(0, size.height * .009);
    pathTop.cubicTo(size.width * .24, size.height * .45, size.width * .8,
        size.height * .0009, size.width, size.height * 0.00009);
    pathTop.cubicTo(size.width * -20, size.height * .00009, size.width + 15,
        size.height, 0, size.height);
    canvas.drawPath(pathTop, paintTop);
    pathTop.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
