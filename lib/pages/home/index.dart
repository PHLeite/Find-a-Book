import 'package:find_a_book/pages/HomePage/home.dart';
import 'package:find_a_book/pages/cadastrar_livro/cadastrar.dart';
import 'package:find_a_book/pages/perfil/perfil.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    Home(),
    CadastrarLivro(),
    Perfil()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value){
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),        
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add ),
            label: 'Cadastrar'
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage('https://voxnews.com.br/wp-content/uploads/2017/04/unnamed.png'),
            ),
            label: 'Perfil'
          ),
          
        ],
        
      ),             
    );
   }
}