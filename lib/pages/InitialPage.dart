import 'package:flutter/material.dart';

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
      body: SafeArea(child:
          Column(
            children: [
              Expanded(
                child: Container(
                  height: height /2,
                  color: Colors.black,
                ),
              ),Expanded(
                child: Container(
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
                              color: _isPressed ? Color.fromARGB(
                                  255, 197, 197, 197) : Color.fromARGB(255, 0, 51, 102),
                              borderRadius: BorderRadius.circular(30)
                          ),
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
                                        decoration:
                                        BoxDecoration(
                                            borderRadius: BorderRadius.circular(0.01),
                                            color: Color(0xE3E3E3FF)
                                        ),
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
                              color: _isPressed ? Color.fromARGB(255, 0, 51, 102) : Color.fromARGB(
                                  255, 197, 197, 197),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: ElevatedButton(
                            child: Text(
                              'Desejo me cadastrar',
                              style: TextStyle(fontSize: 20, color: Colors.black45),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(color: Colors.black, width: 2)
                                ),
                                minimumSize: Size(300, 50),
                                backgroundColor: Colors.white
                            ),
                            onPressed: _toggleButton,
                          ),
                        ),
                      ),
                    ],
                  ),),
              ),
            ],
          )
      ),
    );
  }
}
