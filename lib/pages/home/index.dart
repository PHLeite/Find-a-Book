import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/HomePage/home.dart';
import 'package:find_a_book/pages/cadastrar_livro/cadastrar.dart';
import 'package:find_a_book/pages/chat/chat.dart';
import 'package:find_a_book/pages/perfil/perfil.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var menuAtivo = [
    false,
    false,
    false,
    false,
  ];
  final _pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
           Home(),//0
           CadastrarLivro(),//1
           Chat(),//2
           Perfil(),//3
        ],
      ),

      bottomSheet:  
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width-50,
              height: MediaQuery.of(context).size.height/11,
              decoration: BoxDecoration(
                color: Cores.verdeAgua,
                borderRadius: new BorderRadius.all(new Radius.circular(30)),
              ),
              child: Row(
                children: [
                  _buildItemMenu(
                    Icons.home, 'HOME', 0, () => _pageController.jumpToPage(0)),
                  _buildItemMenu(
                    Icons.add, 'Cadastros', 1, () => _pageController.jumpToPage(1)),
                _buildItemMenu(
                    Icons.chat, 'Buscas', 2, () => _pageController.jumpToPage(2)),
                _buildItemMenu
                (Icons.person, 'Noticias', 3, () => _pageController.jumpToPage(3)),
                ],
              ),
            ),
          ),
        ),
      
    );
  }
  Widget _buildItemMenu(icone, texto, indice, VoidCallback onClick) {
    return Container(
      width: MediaQuery.of(context).size.width/5,
      child: TextButton(
        child: Row(
          children: [
            Icon(icone, color: Colors.white),
          ],
        ),
        onPressed: () {
          onClick();
        },
      ),
    );
  }
}