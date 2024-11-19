import 'package:derredor/style/style.dart';
import 'package:flutter/material.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({super.key});

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class Item {
  final String title;
  bool isFavorite;

  Item({required this.title, this.isFavorite = true});
}

class _FavoritosPageState extends State<FavoritosPage> {
  List<Item> items = [
    Item(title: 'Item 1'),
    Item(title: 'Item 2'),
    Item(title: 'Item 3'),
  ];

  void _toggleFavorite(int index) {
    setState(() {
      items[index].isFavorite = !items[index].isFavorite;
    });
  }

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
            icon: const Icon(
              Icons.arrow_back,
              color: StyleApp.detailsWhite1,
            )),
        title: const Text(
          "Favoritos",
          style: TextStyle(fontSize: 20, color: StyleApp.detailsWhite1),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // essa column e a lista dos itens favoritados
          children: items
              .map((item) => Padding(
                    // Modelo de item favoritado, esse wiget será o amontuado de coisas que o item favoritado ira mostrar na tela, cada wiget desse será um item favoritado
                    padding: const EdgeInsets.fromLTRB(7, 7, 7, 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border(
                            left: BorderSide(
                                color: Colors.grey.shade200, width: 1),
                            right: BorderSide(
                                color: Colors.grey.shade200, width: 1),
                            bottom: BorderSide(
                                color: Colors.grey.shade200, width: 1)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            // imagem do item favoritado
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(12.0),
                                image: const DecorationImage(
                                    image: AssetImage('assets/jalapao.png'),
                                    fit: BoxFit.cover)),
                            width: largura,
                            height: altura / 3,
                          ),
                          Padding(
                            // titulo do item favoritado
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: SizedBox(
                              height: 30,
                              child: Row(
                                children: [
                                  SizedBox(
                                    // container que vai delimitar o tamanho do titulo do item para nao atrapalhar o icone de favorito
                                    width: largura / 1.25,
                                    child: Text(
                                      item.title,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  IconButton(
                                    // icone de favorito com função que muda de icon quando clicado
                                    onPressed: () {
                                      _toggleFavorite(items.indexOf(item));
                                    },
                                    icon: item.isFavorite
                                        ? const Icon(Icons.favorite)
                                        : const Icon(Icons.favorite_border),
                                    iconSize: 20,
                                    color: StyleApp.detailsColor_2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            // avaliação do item favoritado
                            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: SizedBox(
                              height: 20,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: largura / 1.6,
                                    child: const Text(
                                      "Avaliação",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    size: 20,
                                    color: StyleApp.detailsColor_2,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    size: 20,
                                    color: StyleApp.detailsColor_2,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    size: 20,
                                    color: StyleApp.detailsColor_2,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    size: 20,
                                    color: StyleApp.detailsColor_2,
                                  ),
                                  const Icon(
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
                  ))
              .toList(),
        ),
      ),
    );
  }
}
