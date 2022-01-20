import 'package:flutter/material.dart';

class Livro extends StatefulWidget {
  final String photo;
  const Livro({required this.photo, Key? key }) : super(key: key);

  @override
  _LivroState createState() => _LivroState();
}

class _LivroState extends State<Livro> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: MediaQuery.of(context).size.height/3,
        width: MediaQuery.of(context).size.width/2.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.photo),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}