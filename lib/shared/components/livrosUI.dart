import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/livro/Paglivro.dart';
import 'package:find_a_book/pages/livro/editarlivro.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class LivrosUI extends StatefulWidget {
  final String livro;
  final String pag;
  const LivrosUI({Key? key, required this.livro, required this.pag}) : super(key: key);

  @override
  _LivrosUIState createState() => _LivrosUIState();
}

class _LivrosUIState extends State<LivrosUI> {
  String? email = '';
  CollectionReference books = FirebaseFirestore.instance.collection('books');
  String paths = '';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: books.doc(widget.livro).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
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
            ));
          }
          if (true) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            email = data['userEmail'];
            if (paths == '') {
              printUrl();
            }
            return 
            GestureDetector(
              
                onTap: () {
                  if(widget.pag == 'perfil'){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditarLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
                      )
                    );
                  }
                  else if(widget.pag == 'home'){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
                      )
                    );
                  }
                },
             
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 15,
                    bottom: MediaQuery.of(context).size.height / 40,
                    top: 0),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(paths), fit: BoxFit.cover)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        data['valor'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }

  Future printUrl() async {
    try {
      var ref = FirebaseStorage.instance
          .ref()
          .child('uploads/$email/books/${widget.livro}');
      String url = (await ref.getDownloadURL()).toString();
      setState(() {
        this.paths = url;
      });
    } on Exception catch (e) {
      setState(() {
        paths =
            'https://islandpress.org/sites/default/files/default_book_cover_2015.jpg';
      });
      print("Deu merda");
    }
  }
}
