import 'dart:ffi' as ffi;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:derredor/style/style.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

final List<String> _sexList = ['Masculino', 'Feminino', 'Prefiro não dizer'];
String? _selectedSex;

class _RegisterpageState extends State<Registerpage> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(Icons.person_add_rounded,
                      color: Style.Azul, size: 130),
                ),
              ],
            ),
            SizedBox(
              height: 120,
            ),
            Column(
              children: [
                Container(
                  width: largura,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: "Nome:",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          )),
                    ),
                  ),
                ),
                Container(
                  width: largura,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Sobrenome:",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                  child: Container(
                    width: largura,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DropdownButton<String>(
                          hint: Text("Sexo:"),
                          value: _selectedSex,
                          items: _sexList.map((String sex) {
                            return DropdownMenuItem<String>(
                              value: sex,
                              child: Text(sex),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedSex = newValue!;
                              print(_selectedSex);
                            });
                          },
                          icon: Icon(Icons.menu_rounded),
                          underline: Container(
                            height: 1,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: largura,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Email:",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          )),
                    ),
                  ),
                ),
                Container(
                  width: largura,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Usuário:",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          )),
                    ),
                  ),
                ),
                Container(
                  width: largura,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Senha:",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(largura / 2, 50),
                  backgroundColor: Style.Azul,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Text("CADASTRAR",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
