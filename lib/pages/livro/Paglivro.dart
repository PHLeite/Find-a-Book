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
      body: Center(child: Text('Livro'),),
    );
  }
}