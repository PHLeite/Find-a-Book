import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/core/imagens.dart';
import 'package:find_a_book/pages/livro/livro.dart';
import 'package:find_a_book/shared/components/categoriesUI.dart';
import 'package:flutter/material.dart';


class PagLivro extends StatefulWidget {
  const PagLivro({ Key? key }) : super(key: key);

  @override
  _PagLivroState createState() => _PagLivroState();
}

class _PagLivroState extends State<PagLivro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'it - A coisa',
          style: TextStyle(color: Cores.verdeAgua, fontSize: 30),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 170, top: 20),
            child: Container(
              child: Text(
                'NOVO',
                style: TextStyle(color: Cores.azul, fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 125, top: 15),
                  child: Text(
                    'Autor: ',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    'Stephen King',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 135),
                  child: Text(
                    'Editora: ',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ),
                Text(
                  'Suma',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 150, right: 150, top: 15, bottom: 15),
              child: Categorie(Categoria: "Terror"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
             child: SingleChildScrollView(
              
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Livro(photo: "assets/images/livro1.jpg"),
                  Livro(photo: "assets/images/livro2.jpg"),
                  Livro(photo: "assets/images/livro3.jpg"),
                  Livro(photo: "assets/images/livro4.jpg"),
                ],
              ),
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Container(
              child: Text(
                "R\$70,90",
                style: TextStyle(fontSize: 25, color: Colors.black54, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          Container(
            child: Column(  
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 8),
                  child: Text(
                    'Descrição',
                    style: TextStyle(  
                      color: Cores.verdeAgua, fontSize: 20, fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40, bottom: 15),
                  child: Text(
                    'O livro fala sobre uma palhaço que aterroriza a vida das crianças de um cidade',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ],
            ),
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 10, 0, 10),
                child: Container(
                  width: MediaQuery.of(context).size.width/5,
                  height: MediaQuery.of(context).size.height/12,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(Imagens.fotoPerfil),
                  ),  
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Text(
                      'Alessandra Resende',
                      style: TextStyle(fontSize: 15)
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: MediaQuery.of(context).size.height/20,
                    child: TextButton(
                      onPressed: () {
                        
                      },
                      child: Text(
                        'Iniciar Chat',
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Cores.roxo),
                        shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        )
                        )
                      ),
                   ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}