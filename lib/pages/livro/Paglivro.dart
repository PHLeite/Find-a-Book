import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/perfilView/perfilView.dart';
import 'package:find_a_book/shared/components/categoriesUI.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PagLivro extends StatefulWidget {
  final livro;
  const PagLivro({Key? key, required this.livro}) : super(key: key);

  @override
  _PagLivroState createState() => _PagLivroState();
}

class _PagLivroState extends State<PagLivro> {
  String? email = '';
  CollectionReference books = FirebaseFirestore.instance.collection('books');
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String pathLivro = '';
  String pathPerfil = '';

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
            if (pathLivro == '') {
              printUrlLivro();
            }
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                centerTitle: true,
                title: Text(
                  data['nome'],
                  style: TextStyle(color: Cores.verdeAgua, fontSize: 30),
                ),
              ),
              body: ListView(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        child: Text(
                          data['estado'],
                          style: TextStyle(
                              color: Cores.azul,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 150, right: 150, top: 15, bottom: 15),
                      child: Categorie(categoria: data['categoria']),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, bottom: 15),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 2.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(pathLivro),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                
                  Center(
                    child: Container(
                      child: Text(
                        data['valor'],
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 8),
                      child: Text(
                        'Descrição',
                        style: TextStyle(
                            color: Cores.verdeAgua,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 40, left: 40, bottom: 15),
                      child: Text(
                        data['descricao'],
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            'Autor: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ),
                        Text(
                          data['autor'],
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Text(
                            'Editora: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ),
                        Text(
                          data['editora'],
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder<DocumentSnapshot>(
                    future: users.doc(email).get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
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
                        Map<String, dynamic> data2 =
                            snapshot.data!.data() as Map<String, dynamic>;
                        if (pathPerfil == '') {
                          printUrlPerfil();
                        }
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(70, 70, 0, 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PerfilView(
                                                email: data['userEmail'],
                                              )));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundImage: NetworkImage(pathPerfil),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 70),
                              child: Column(
                                children: [
                                  Container(
                                    child: Text(data2['nome'],
                                        style: TextStyle(fontSize: 15)),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    child: TextButton(
                                      onPressed: () {
                                        launch(data['link']);
                                      },
                                      child: Text(
                                        'Iniciar Chat',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Cores.roxo),
                                          shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ))),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          }
        });
  }

  printUrlLivro() async {
    try {
      var ref = FirebaseStorage.instance
          .ref()
          .child('uploads/$email/books/${widget.livro}');
      String url = (await ref.getDownloadURL()).toString();
      print("$url");
      if (url != '') {
        setState(() {
          pathLivro = url;
        });
      } else {
        print("Deu bosta");
        setState(() {
          pathLivro =
              'https://islandpress.org/sites/default/files/default_book_cover_2015.jpg';
        });
      }
    } on Exception catch (e) {
      setState(() {
        pathLivro =
            'https://islandpress.org/sites/default/files/default_book_cover_2015.jpg';
      });
      print("Deu merda");
    }
  }

  printUrlPerfil() async {
    try {
      var ref =
          FirebaseStorage.instance.ref().child('uploads/$email/fotoDePerfil');
      String url = (await ref.getDownloadURL()).toString();
      print("$url");
      if (url != '') {
        setState(() {
          pathPerfil = url;
        });
      } else {
        print("Deu bosta");
        setState(() {
          pathPerfil =
              'https://voxnews.com.br/wp-content/uploads/2017/04/unnamed.png';
        });
      }
    } on Exception catch (e) {
      setState(() {
        pathPerfil =
            'https://voxnews.com.br/wp-content/uploads/2017/04/unnamed.png';
      });
      print("Deu merda");
    }
  }
}
