import 'package:find_a_book/core/imagens.dart';
import 'package:find_a_book/pages/chat/quadradochat.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Conversas"),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Quadrado(book: 'Harry Potter', foto: Imagens.fotoPerfil , nome: 'Vanessa Lopes',),
          Quadrado(book: 'A culpa é das estrelas', foto: Imagens.fotoPerfil , nome: 'Serena',),
        ],
      ),
    );
  }
}