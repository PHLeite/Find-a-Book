import 'package:find_a_book/core/cores.dart';
import 'package:flutter/material.dart';

class Categorie extends StatelessWidget {
  final String Categoria;
  const Categorie({ Key? key, required this.Categoria }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width/3.8,
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width/4.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Cores.laranja,
          ),
          height: MediaQuery.of(context).size.height/25,
          
          child: Align(
            alignment: Alignment.center,
            child: Text(Categoria,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
            ),
          ),
        ),
      ),
    );  
  }
}