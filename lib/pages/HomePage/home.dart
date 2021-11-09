import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/shared/components/categoriesUI.dart';
import 'package:find_a_book/shared/components/livrosUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, 
   )
  );

    return Column(
      children: [
        Container(height: MediaQuery.of(context).size.height/25,),
        Container(
          width: MediaQuery.of(context).size.width/1.05,
          height: MediaQuery.of(context).size.height/13,
          child: TextField(
            
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search, color: Colors.white,),
              fillColor: Cores.verdeAgua,
              filled: true,
              focusColor: Cores.verdeAgua,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none
              ),
              hintText: 'Harry Potter e a Pedra Filosofal',
              hintStyle: TextStyle(color: Colors.white54)
            ),
          )
        ),

        Expanded(
          flex: 0,
          child: Container(
            width: MediaQuery.of(context).size.width*10,
            
            child: SingleChildScrollView(
              
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                Categorie(Categoria: "Ficção"),
                Categorie(Categoria: "Romance"),
                Categorie(Categoria: "Biografia"),
                Categorie(Categoria: "Infanto-Juvenis"),
                Categorie(Categoria: "Brasileiros"),
                Categorie(Categoria: "Poesias"),
                Categorie(Categoria: "Contos"),
                Categorie(Categoria: "Coleções"),
                Categorie(Categoria: "Técnicos"),
                Categorie(Categoria: "Auto Ajuda"),
                Categorie(Categoria: "Religiosos"),
                ],
              ),
            ),
          ),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  LivrosUI(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
