import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/livro/Paglivro.dart';
import 'package:flutter/material.dart';

class LivrosUI extends StatefulWidget {
  final String livro;
  const LivrosUI({ Key? key, required this.livro}) : super(key: key);

  @override
  _LivrosUIState createState() => _LivrosUIState();
}

class _LivrosUIState extends State<LivrosUI> {
  CollectionReference books = FirebaseFirestore.instance.collection('books');
  String path = '';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: books.doc(widget.livro).get(),
      builder:(BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Cores.roxo,
            )
          );
        }
        if (true) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          
          return Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width/15,
              bottom: MediaQuery.of(context).size.height/40,
              top: 0
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PagLivro(livro: widget.livro)
                ));
              },
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/3,
                    width: MediaQuery.of(context).size.width/2.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                      image: AssetImage("assets/images/livro1.jpg"),
                      fit: BoxFit.cover
                      )
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    child: Text(data['valor'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      color: Colors.black
                    ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      });

  }
}