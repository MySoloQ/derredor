import 'package:derredor/style/style.dart';
import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({super.key});

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

bool _isFavorite = true;

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: StyleApp.detailsWhite1,
      appBar: AppBar(
          backgroundColor: StyleApp.detailsLago1,
          leading: IconButton(
              // botão de voltar para a página anterior
              onPressed: () {
                Navigator.pushNamed(context, 'initialPage');
              },
              icon: Icon(
                Icons.arrow_back,
                color: StyleApp.detailsWhite1,
              )),
          title: Center(
            // Titulo da AppBar
            child: Text(
              "Favoritos",
              style: TextStyle(fontSize: 20, color: StyleApp.detailsWhite1),
            ),
          ),
          actions: [
            Padding(
              // Botão que abre a caixa de pesquisa
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: StyleApp.detailsWhite1,
                  )),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          // essa column e a lista dos itens favoritados
          children: [
            Padding(
              // Modelo de item favoritado, esse wiget será o amontuado de coisas que o item favoritado ira mostrar na tela, cada wiget desse será um item favoritado
              padding: EdgeInsets.fromLTRB(7, 7, 7, 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                      left: BorderSide(color: Colors.grey.shade200, width: 1),
                      right: BorderSide(color: Colors.grey.shade200, width: 1),
                      bottom:
                          BorderSide(color: Colors.grey.shade200, width: 1)),
                ),
                child: Column(
                  children: [
                    Container(
                      // imagem do item favoritado
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                              image: AssetImage('assets/jalapao.png'),
                              fit: BoxFit.cover)),
                      width: largura,
                      height: altura / 3,
                    ),
                    Padding(
                      // titulo do item favoritado
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            Container(
                              // container que vai delimitar o tamanho do titulo do item para nao atrapalhar o icone de favorito
                              width: largura / 1.25,
                              child: Text(
                                "Titulo do item favoritado",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              // icone de favorito com função que muda de icon quando clicado
                              onPressed: () {
                                setState(() {
                                  _isFavorite = !_isFavorite;
                                });
                              },
                              icon: _isFavorite
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border),
                              iconSize: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      // avaliação do item favoritado
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        height: 20,
                        child: Row(
                          children: [
                            Container(
                              width: largura / 1.6,
                              child: Text(
                                "Avaliação",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              // Modelo de item favoritado, esse wiget será o amontuado de coisas que o item favoritado ira mostrar na tela, cada wiget desse será um item favoritado
              padding: EdgeInsets.fromLTRB(7, 7, 7, 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                      left: BorderSide(color: Colors.grey.shade200, width: 1),
                      right: BorderSide(color: Colors.grey.shade200, width: 1),
                      bottom:
                          BorderSide(color: Colors.grey.shade200, width: 1)),
                ),
                child: Column(
                  children: [
                    Container(
                      // imagem do item favoritado
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                              image: AssetImage('assets/jalapao.png'),
                              fit: BoxFit.cover)),
                      width: largura,
                      height: altura / 3,
                    ),
                    Padding(
                      // titulo do item favoritado
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            Container(
                              // container que vai delimitar o tamanho do titulo do item para nao atrapalhar o icone de favorito
                              width: largura / 1.25,
                              child: Text(
                                "Titulo do item favoritado",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              // icone de favorito com função que muda de icon quando clicado
                              onPressed: () {
                                setState(() {
                                  _isFavorite = !_isFavorite;
                                });
                              },
                              icon: _isFavorite
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border),
                              iconSize: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      // avaliação do item favoritado
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        height: 20,
                        child: Row(
                          children: [
                            Container(
                              width: largura / 1.6,
                              child: Text(
                                "Avaliação",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              // Modelo de item favoritado, esse wiget será o amontuado de coisas que o item favoritado ira mostrar na tela, cada wiget desse será um item favoritado
              padding: EdgeInsets.fromLTRB(7, 7, 7, 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                      left: BorderSide(color: Colors.grey.shade200, width: 1),
                      right: BorderSide(color: Colors.grey.shade200, width: 1),
                      bottom:
                          BorderSide(color: Colors.grey.shade200, width: 1)),
                ),
                child: Column(
                  children: [
                    Container(
                      // imagem do item favoritado
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                              image: AssetImage('assets/jalapao.png'),
                              fit: BoxFit.cover)),
                      width: largura,
                      height: altura / 3,
                    ),
                    Padding(
                      // titulo do item favoritado
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            Container(
                              // container que vai delimitar o tamanho do titulo do item para nao atrapalhar o icone de favorito
                              width: largura / 1.25,
                              child: Text(
                                "Titulo do item favoritado",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              // icone de favorito com função que muda de icon quando clicado
                              onPressed: () {
                                setState(() {
                                  _isFavorite = !_isFavorite;
                                });
                              },
                              icon: _isFavorite
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border),
                              iconSize: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      // avaliação do item favoritado
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        height: 20,
                        child: Row(
                          children: [
                            Container(
                              width: largura / 1.6,
                              child: Text(
                                "Avaliação",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              // Modelo de item favoritado, esse wiget será o amontuado de coisas que o item favoritado ira mostrar na tela, cada wiget desse será um item favoritado
              padding: EdgeInsets.fromLTRB(7, 7, 7, 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                      left: BorderSide(color: Colors.grey.shade200, width: 1),
                      right: BorderSide(color: Colors.grey.shade200, width: 1),
                      bottom:
                          BorderSide(color: Colors.grey.shade200, width: 1)),
                ),
                child: Column(
                  children: [
                    Container(
                      // imagem do item favoritado
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                              image: AssetImage('assets/jalapao.png'),
                              fit: BoxFit.cover)),
                      width: largura,
                      height: altura / 3,
                    ),
                    Padding(
                      // titulo do item favoritado
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            Container(
                              // container que vai delimitar o tamanho do titulo do item para nao atrapalhar o icone de favorito
                              width: largura / 1.25,
                              child: Text(
                                "Titulo do item favoritado",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              // icone de favorito com função que muda de icon quando clicado
                              onPressed: () {
                                setState(() {
                                  _isFavorite = !_isFavorite;
                                });
                              },
                              icon: _isFavorite
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border),
                              iconSize: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      // avaliação do item favoritado
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        height: 20,
                        child: Row(
                          children: [
                            Container(
                              width: largura / 1.6,
                              child: Text(
                                "Avaliação",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              // Modelo de item favoritado, esse wiget será o amontuado de coisas que o item favoritado ira mostrar na tela, cada wiget desse será um item favoritado
              padding: EdgeInsets.fromLTRB(7, 7, 7, 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                      left: BorderSide(color: Colors.grey.shade200, width: 1),
                      right: BorderSide(color: Colors.grey.shade200, width: 1),
                      bottom:
                          BorderSide(color: Colors.grey.shade200, width: 1)),
                ),
                child: Column(
                  children: [
                    Container(
                      // imagem do item favoritado
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                              image: AssetImage('assets/jalapao.png'),
                              fit: BoxFit.cover)),
                      width: largura,
                      height: altura / 3,
                    ),
                    Padding(
                      // titulo do item favoritado
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        height: 30,
                        child: Row(
                          children: [
                            Container(
                              // container que vai delimitar o tamanho do titulo do item para nao atrapalhar o icone de favorito
                              width: largura / 1.25,
                              child: Text(
                                "Titulo do item favoritado",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              // icone de favorito com função que muda de icon quando clicado
                              onPressed: () {
                                setState(() {
                                  _isFavorite = !_isFavorite;
                                });
                              },
                              icon: _isFavorite
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border),
                              iconSize: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      // avaliação do item favoritado
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Container(
                        height: 20,
                        child: Row(
                          children: [
                            Container(
                              width: largura / 1.6,
                              child: Text(
                                "Avaliação",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                              color: StyleApp.detailsColor_2,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
