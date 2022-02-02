import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/shared/components/livrosUI.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  CollectionReference books = FirebaseFirestore.instance.collection('books');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              width: MediaQuery.of(context).size.width/1.05,
              height: MediaQuery.of(context).size.height/13,
              child: Form(
                child: TextFormField(
                  controller: searchController,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white,),
                    fillColor: Cores.verdeAgua,
                    filled: true,
                    focusColor: Cores.verdeAgua,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none
                    ),
                    hintText: 'Nome do Livro',
                    hintStyle: TextStyle(color: Colors.white54)
                  ),
                  onFieldSubmitted: (String _){
                    print(_);
                  }
                ),
              )
            ),
          ),
          FutureBuilder(
            future:
              books.where('nome', isGreaterThanOrEqualTo: searchController.text).get(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Something went wrong"));
                }
                if (snapshot.hasData && snapshot.connectionState == ConnectionState.none) {
                  return Text("Nenhum Livro encontrado");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Cores.roxo,
                    )
                  );
                }
                else{
                  List<String> data = snapshot.data!.docs.map((e) => e.id).toList();
                  return Column(
                    children: [
                      Row(
                        children: [
                          LivrosUI(livro: data[0], pag: 'home',),
                          // LivrosUI(livro: data[2], pag: 'home'),
                        ],
                      ),
                              
                      Row(
                        children: [
                          // LivrosUI(livro: data[3], pag: 'home'),
                          // LivrosUI(livro: data[4], pag: 'home'),
                        ],
                      ),
                    ],
                  );
                }
              }
          ),
        ]
      ),
    );
  }
}