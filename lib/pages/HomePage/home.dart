import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/livro/Paglivro.dart';
import 'package:find_a_book/pages/livro/editarlivro.dart';
import 'package:find_a_book/shared/components/categoriesUI.dart';
import 'package:find_a_book/shared/components/livrosUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
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
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
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
        ),

        Expanded(
          flex: 0,
          child: Container(
            width: MediaQuery.of(context).size.width*10,
            
            child: SingleChildScrollView(
              
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                Categorie(categoria: "Ficção"),
                Categorie(categoria: "Romance"),
                Categorie(categoria: "Biografia"),
                Categorie(categoria: "Infanto-Juvenis"),
                Categorie(categoria: "Brasileiros"),
                Categorie(categoria: "Poesias"),
                Categorie(categoria: "Contos"),
                Categorie(categoria: "Coleções"),
                Categorie(categoria: "Técnicos"),
                Categorie(categoria: "Auto Ajuda"),
                Categorie(categoria: "Religiosos"),
                Categorie(categoria: "Terror"),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height/40, 
          width: MediaQuery.of(context).size.width,
          color: Colors.white
        ),  
        Expanded(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              scrollDirection: Axis.vertical,
              
                children: [
                  Row(
                    children: [
                      GestureDetector(  
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditarLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
                            )
                          );
                        },
                      child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
                      ),
                      GestureDetector(  
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
                            )
                          );
                        },
                      child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
                      ),
                      
                     
                    ],
                  ),
                   Row(
                    children: [
                      GestureDetector(  
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
                            )
                          );
                        },
                      child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
                      ),
                      GestureDetector(  
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
                            )
                          );
                        },
                      child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
                      ),
                      
                     
                    ],
                  ),
                   Row(
                    children: [
                      GestureDetector(  
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
                            )
                          );
                        },
                      child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
                      ),
                      GestureDetector(  
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
                            )
                          );
                        },
                      child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
                      ),
                      
                     
                    ],
                  ),
                   Row(
                    children: [
                      GestureDetector(  
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
                            )
                          );
                        },
                      child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
                      ),
                      GestureDetector(  
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
                            )
                          );
                        },
                      child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
                      ),
                      
                     
                    ],
                  ),
                ],
              ),
          ),
        ),
      ],
    );
  }
}
