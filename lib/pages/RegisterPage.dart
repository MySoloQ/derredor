import 'package:flutter/material.dart';
import 'package:derredor/style/style.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Flexible(
          child: Column(
        children: [
          SizedBox(
            height: altura / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_add_sharp, color: Style.Azul, size: 130),
            ],
          ),
          SizedBox(
            height: altura / 10,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Nome de Usuário:",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Senha:",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  )),
            ),
          ),
          SizedBox(
            height: altura / 8,
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
      )),
    );
  }
}
