import 'package:derredor/style/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Paginateste extends StatefulWidget {
  const Paginateste({super.key});

  @override
  State<Paginateste> createState() => _PaginatesteState();
}

class _PaginatesteState extends State<Paginateste> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleApp.detailsLago2,
        title: Text(
          'Página Teste',
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: StyleApp.bgColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  letterSpacing: .5)),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: height * .3,
                width: width,
                color: Colors.red,
                child: Text('1'),
              ),
              Container(
                height: height * .3,
                width: width,
                color: Colors.green,
                child: Text('2'),
              ),
              Container(
                height: height * .3,
                width: width,
                color: Colors.blue,
                child: Text('3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
