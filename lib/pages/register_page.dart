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

class _RegisterpageState extends State<Registerpage> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    final List<String> _sexList = ['Um', 'Dois'];
    String _selectedSex = 'Um';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Icon(Icons.person_add_rounded,
                        color: Style.Azul, size: 130)),
              ],
            ),
            Container(
              width: largura,
              height: 60,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Nome:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      )),
                ),
              ),
            ),
            DropdownButton(
              value: _selectedSex,
              items: _sexList.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _selectedSex = value!;
                  print(value);
                });
              },
              icon: const Icon(Icons.arrow_drop_down),
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
