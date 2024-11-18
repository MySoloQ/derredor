import 'package:derredor/style/style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * .06,
        backgroundColor: StyleApp.detailsLago1,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
          child: Container(
            height: 15,
            width: 15,
            decoration: BoxDecoration(
              color: StyleApp.textColors,
              borderRadius: BorderRadius.circular(30),
            ),
            child: FittedBox(
              child: Icon(
                Icons.account_circle,
                color: StyleApp.detailsWhite1,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Column(
          children: [
            Text('AQUI VAI O NOME'),
            Text('aqui vai a localização atual'),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Cabeçalho da Gaveta'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Ação ao clicar no item 1
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'TESTES'),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'TESTE')
      ]
      ,backgroundColor: StyleApp.detailsLago2,),
    );
  }
}
