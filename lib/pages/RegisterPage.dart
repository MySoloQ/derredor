import 'dart:ffi' as ffi;
import 'package:derredor/settings/api/app_variables_db.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:derredor/style/style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterpageState();
}

final List<String> _sexList = ['Masculino', 'Feminino', 'Prefiro não dizer'];
String? _selectedSex;
String? _selectedDate = "";
String _labelText = "Data de nascimento";
bool _inObscured = true;

class _RegisterpageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int _age = 0;
  final signInKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  final List<String> _emailList = [
    '@gmail.com',
    '@yahoo.com',
    '@outlook.com',
    '@hotmail.com',
    '@live.com',
    '@aol.com'
  ];

  String? _selectedEmail;

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'initialPage');
            },
            icon: Icon(Icons.arrow_back)),
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
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                        "Sign-In",
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: StyleApp.detailsLago1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Form(
              key: signInKey,
              child: Column(
                children: [
                  Container(
                    width: largura,
                    height: 80,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira um nome, porfavor.';
                          } else if (value.length >= 100) {
                            return 'Insira um nome menor que 100 caracteres, porfavor.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: "Nome",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    width: largura,
                    height: 80,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira um sobrenome, porfavor.';
                          } else if (value.length >= 255) {
                            return 'Insira um sobrenome menor que 255 caracteres, porfavor.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Sobrenome",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: Container(
                      width: largura,
                      height: 60,
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira um email, porfavor.';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Insira um email válido, porfavor.';
                        }
                        return null;
                      },
                      maxLines: 1,
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        suffixIcon: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text('@'),
                            value: _selectedEmail,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedEmail = newValue;
                                if (_controller.text.contains('@')) {
                                  _controller.text =
                                      _controller.text.split('@')[0] +
                                          newValue!;
                                } else {
                                  _controller.text =
                                      _controller.text + newValue!;
                                }
                                _controller.selection =
                                    TextSelection.fromPosition(
                                  TextPosition(offset: _controller.text.length),
                                );
                              });
                            },
                            items: _emailList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    // seleção de idade
                    children: [
                      Container(
                        width: largura,
                        height: 80,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: _labelText,
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
                    height: 80,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira um nome de usuário, porfavor.';
                          } else if (EmailValidator.validate(value)) {
                            return 'Insira um nome de usuário válido, porfavor.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: "Usuário",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    width: largura,
                    height: 80,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Insira uma senha, porfavor.';
                          } else if (value.length >= 15 || value.length <= 7) {
                            return 'Min de 7 ou max de 15 caracteres, porfavor.';
                          }
                        },
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
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  if (signInKey.currentState!.validate()) {
                    Provider.of<AppVariablesDb>(context, listen: false)
                        .signUpProcess
                      .signUpVerification(
                          context,
                          _nameController.text,
                          _surnameController.text,
                          _sexController.text,
                          _emailController.text,
                          _userController.text,
                          _passwordController.text,
                          _age);
                  }
                },
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
    final DateTime currentDate = DateTime.now();
    final DateTime initialDate =
        DateTime(currentDate.year - 18, currentDate.month, currentDate.day);
    final DateTime firstDate = DateTime(1900);
    final DateTime lastDate = initialDate;

    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);

    if (_picked != null) {
      setState(() {
        _selectedDate = DateFormat('yyyy-MM-dd').format(_picked);
        _age = (currentDate.year).toInt() - (_picked.year).toInt();
      });
    }
  }
}
