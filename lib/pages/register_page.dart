
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
String? _selectedDate = "";
String _labelText = "Data de nascimento";
bool _inObscured = true;

class _RegisterpageState extends State<Registerpage> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Text(
                        "Sing-In",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: StyleApp.detailsLago1),

                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                  child: Container(
                    child: Text(
                        "Para continuar precisamos de algumas informações"),
                  ),
                ),
              ],
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
                          labelText: "Nome",
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
                          labelText: "Sobrenome",
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
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: DropdownButton<String>(
                            hint: Text("Sexo"),
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
                            iconEnabledColor: Colors.transparent,
                            underline: Container(
                              height: 1,
                              color: Colors.transparent,
                            ),
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
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          )),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: largura,
                      height: 60,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: _labelText,
                            prefixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          ),
                          readOnly: true,
                          onTap: () {
                            _selectDate();
                            setState(() {
                              _labelText = _selectedDate!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: largura,
                  height: 60,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Usuário",
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
                      obscureText: _inObscured,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(_inObscured
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _inObscured = !_inObscured;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 90,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(largura / 2, 50),
                    backgroundColor: StyleApp.detailsLago1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Text("CADASTRAR",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_picked != null) {
      setState(() {
        _selectedDate = _picked.toString();
      });
    }
  }
}
