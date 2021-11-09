import 'package:find_a_book/core/cores.dart';
import 'package:flutter/material.dart';

class Categorie extends StatelessWidget {
  final String Categoria;
  const Categorie({ Key? key, required this.Categoria }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/4,
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.of(context).size.width/4.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Cores.laranja,
        ),
        height: MediaQuery.of(context).size.height/35,
        
        child: Align(
          alignment: Alignment.center,
          child: Text(Categoria,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w900,
          ),
          ),
        ),
      ),
    );  
  }
}