import 'package:find_a_book/core/cores.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();

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
          //FutureBuilder(builder: builder)
        ]
      ),
    );
  }
}