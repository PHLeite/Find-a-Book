import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:flutter/material.dart';

class Categorie extends StatefulWidget {
  final String categoria;
  const Categorie({Key? key, required this.categoria}) : super(key: key);

  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  CollectionReference books = FirebaseFirestore.instance.collection('books');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        escolherCategoria();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3.8,
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width / 4.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Cores.laranja,
          ),
          height: MediaQuery.of(context).size.height / 25,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.categoria,
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

  escolherCategoria() async {
    await FirebaseFirestore.instance
        .collection('books')
        .where('categoria', isEqualTo: widget.categoria)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print("${doc.id}");
      });
    });
  }
}
