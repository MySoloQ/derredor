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
    final PageController _pageController = PageController();

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double containerHeight = 330 * .6;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        toolbarHeight: height * .06,
        backgroundColor: StyleApp.detailsLago1,
        leading: Transform.translate(
            offset: Offset(width * .09, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
              child: Container(
                height: 14,
                width: 14,
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
            )),
        title: Transform.translate(
          offset: Offset(width * .1, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nome Teste',
                maxLines: 1,
                style: StyleTextHome.googleRobotoLandingName,
              ),
              Text(
                'Localização, Teste',
                maxLines: 1,
                style: StyleTextHome.googleRobotoLandingLocation,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
            child: IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
                icon: Icon(Icons.menu)),
          )
        ],
        iconTheme:
            IconThemeData(color: StyleApp.detailsWhite1, size: 35, shadows: [
          Shadow(
              color: Colors.black,
              blurRadius: BorderSide.strokeAlignOutside,
              offset: Offset(1, -1))
        ]),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Cabeçalho da Gaveta'),
              decoration: BoxDecoration(
                color: StyleApp.detailsWhite1,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height * .07,
              color: StyleApp.detailsLago1,
              child: Center(
                child: SizedBox(
                  width: width * .80,
                  height: height * .05,
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          hintText: 'Procurar Lugares',
                          hintStyle: StyleTextHome.googleRobotoText,
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(110)),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                size: 35,
                              )))),
                ),
              ),
            ),
            Container(
              child: Text('Categorias'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: StyleApp.bgColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(
                      Icons.window,
                      size: 35,
                      color: StyleApp.detailsWhite1,
                    )),
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: StyleApp.bgColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(
                      Icons.hotel,
                      size: 35,
                      color: StyleApp.detailsWhite1,
                    )),
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: StyleApp.bgColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(
                      Icons.nature_people_rounded,
                      size: 35,
                      color: StyleApp.detailsWhite1,
                    )),
                Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: StyleApp.bgColor,
                        borderRadius: BorderRadius.circular(25)),
                    child: Icon(
                      Icons.beach_access_sharp,
                      size: 35,
                      color: StyleApp.detailsWhite1,
                    )),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text('Todos'),
              Text('Hotel'),
              Text('Natureza'),
              Text('Praias'),
            ]),
            Container(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('Melhores Destinos'), Text('Mostrar todos')],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          height: 350,
                          decoration: BoxDecoration(
                              color: StyleApp.detailsWhite2,
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Container(
                                  height: 330 * .6,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: StyleApp.detailsWhite1,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Stack(children: [
                                    Container(
                                      height: containerHeight,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/backgrounds/initial_page/fervedouro_initial.png'),
                                            fit: BoxFit.cover),
                                        color: StyleApp.detailsWhite1,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 140, 0, 0),
                                      child: Text(
                                        'Fervedouro '
                                        'Bela Vista',
                                        style:
                                            StyleTextHome.googleRobotoCarousel,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 160, 0, 0),
                                      child: Text(
                                        'Jalapão',
                                        style:
                                            StyleTextHome.googleRobotoCarousel2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          170, 136, 0, 0),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                    )
                                  ]),
                                ),Padding(
                                  padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                  child: Container(
                                    height: containerHeight * .56,
                                    decoration: BoxDecoration(
                                        color: StyleApp.detailsWhite2,
                                        borderRadius: BorderRadius.circular(16)),
                                    child: Text(''
                                        ''),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          height: 350,
                          decoration: BoxDecoration(
                              color: StyleApp.detailsWhite2,
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Container(
                                  height: 330 * .6,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: StyleApp.detailsWhite1,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Stack(children: [
                                    Container(
                                      height: containerHeight,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/backgrounds/initial_page/dunas_jalapao_initial_2.png'),
                                            fit: BoxFit.cover),
                                        color: StyleApp.detailsWhite1,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 140, 0, 0),
                                      child: Text(
                                        'Dunas',
                                        style:
                                            StyleTextHome.googleRobotoCarousel,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 160, 0, 0),
                                      child: Text(
                                        'Jalapão',
                                        style:
                                            StyleTextHome.googleRobotoCarousel2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          170, 136, 0, 0),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                    )
                                  ]),
                                ),Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Container(
                                    height: containerHeight * .56,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Text(
                                      'As Dunas do Jalapão são um verdadeiro paraíso natural, situadas no coração do Parque Estadual do Jalapão, no estado do Tocantins. Este fenômeno impressionante é '
                                      'formado pela erosão de rochas de arenito, que ao longo de milhões de anos se tr'
                                      'ansformaram em',
                                      style:
                                          StyleTextHome.googleRobotoCarousel3,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          height: 350,
                          decoration: BoxDecoration(
                              color: StyleApp.detailsWhite2,
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Container(
                                  height: 330 * .6,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: StyleApp.detailsWhite1,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Stack(children: [
                                    Container(
                                      height: containerHeight,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/backgrounds/login_page/natividade_login.png'),
                                            fit: BoxFit.cover),
                                        color: StyleApp.detailsWhite1,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 140, 0, 0),
                                      child: Text(
                                        'Igreja Histórica ',
                                        style:
                                            StyleTextHome.googleRobotoCarousel,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 160, 0, 0),
                                      child: Text(
                                        'Natividade',
                                        style:
                                            StyleTextHome.googleRobotoCarousel2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          170, 136, 0, 0),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                    )
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          height: 350,
                          decoration: BoxDecoration(
                              color: StyleApp.detailsWhite2,
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Container(
                                  height: 330 * .6,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: StyleApp.detailsWhite1,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Stack(children: [
                                    Container(
                                      height: containerHeight,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/backgrounds/initial_page/praca_girassois_initial.png'),
                                            fit: BoxFit.cover),
                                        color: StyleApp.detailsWhite1,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 140, 0, 0),
                                      child: Text(
                                        'Praça dos girassóis',
                                        style:
                                            StyleTextHome.googleRobotoCarousel,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 160, 0, 0),
                                      child: Text(
                                        'Tocantins',
                                        style:
                                            StyleTextHome.googleRobotoCarousel2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          170, 136, 0, 0),
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                    )
                                  ]),
                                ),
                                Container(
                                  height: containerHeight * .75,
                                  decoration: BoxDecoration(
                                      color: StyleApp.detailsWhite2,
                                      borderRadius: BorderRadius.circular(16)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
