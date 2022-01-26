import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/livro/livro.dart';
import 'package:find_a_book/pages/perfilView/perfilView.dart';
import 'package:find_a_book/shared/components/categoriesUI.dart';
import 'package:flutter/material.dart';

class PagLivro extends StatefulWidget {
  final String livro;
  const PagLivro({Key? key, required this.livro}) : super(key: key);

  @override
  _PagLivroState createState() => _PagLivroState();
}

class _PagLivroState extends State<PagLivro> {
  CollectionReference books = FirebaseFirestore.instance.collection('books');
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
                    child: Categorie(Categoria: data['categoria']),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Livro(photo: "assets/images/livro1.jpg"),
                          Livro(photo: "assets/images/livro2.jpg"),
                          Livro(photo: "assets/images/livro3.jpg"),
                          Livro(photo: "assets/images/livro4.jpg"),
                        ],
                      ),
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
                    padding:
                        const EdgeInsets.only(right: 40, left: 40, bottom: 15),
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(70, 70, 0, 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => PerfilView(email: data['userEmail'],)
                          ));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height / 12,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage: NetworkImage('https://voxnews.com.br/wp-content/uploads/2017/04/unnamed.png'),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Column(
                        children: [
                          Container(
                            child: Text('Alessandra Resende',
                                style: TextStyle(fontSize: 15)),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 20,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Iniciar Chat',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Cores.roxo),
                                  shape:
                                      MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ))),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
      }
    );
  }
}
