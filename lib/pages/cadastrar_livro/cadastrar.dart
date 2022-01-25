import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/cadastrar_livro/confirma%C3%A7%C3%A3o.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CadastrarLivro extends StatefulWidget {
  const CadastrarLivro({ Key? key }) : super(key: key);

  @override
  _CadastrarLivroState createState() => _CadastrarLivroState();
}

class _CadastrarLivroState extends State<CadastrarLivro> {
  CollectionReference books = FirebaseFirestore.instance.collection('books');
  String? email = FirebaseAuth.instance.currentUser!.email;
  final formKey = GlobalKey<FormState>();
  final items = ['Novo', 'Usado'];
  String item = "Usado";
  String categoria = "Romance";
  final categorias = ["Ficção", "Romance",  "Biografia", "Infanto-Juvenis", "Brasileiros", "Poesias", "Contos", "Coleções","Técnicos", "Auto Ajuda", "Religiosos","Terror"];
  String? value;
  File? file;
  final nome = TextEditingController();
  final autor = TextEditingController();
  final editora = TextEditingController();
  final link = TextEditingController();
  final descricao = TextEditingController();

  Future<void> registrarLivro() async {
    try {
      books.add({
        'editora': editora.text,
        'nome': nome.text,
        'autor': autor.text,
        'link': link.text,
        'userEmail': email,
        'path': file,
        'descricao': descricao.text,
        'categoria': categoria,
        'estado': item,
      });
      print("Vamo que vamo");
    } on Exception catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Falha ao cadastrar livro")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height/4.5,
                    width: MediaQuery.of(context).size.width/1.2,
                    child: Text(
                        'CADASTRAR LIVRO',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Cores.verdeAgua,
                          fontSize: 45,
                          fontWeight: FontWeight.w900
                        ),
                      ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Foto do livro:',
                    style: TextStyle(
                      color: Cores.roxo,
                      fontWeight: FontWeight.w800,
                      fontSize: 15
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/5,
                  height: MediaQuery.of(context).size.width/5,
                  child: FloatingActionButton(
                    backgroundColor: Cores.azul,
                    onPressed: () {
                    },
                    child: Icon(
                      Icons.add_a_photo, 
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Nome do livro:',
                      style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15
                      ),
                    ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/10,
                  width: MediaQuery.of(context).size.width/1.1,
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: nome,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        hintText: 'Harry Potter'
                      ),
                    ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Autor:',
                      style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15
                      ),
                    ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/10,
                  width: MediaQuery.of(context).size.width/1.1,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: autor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        hintText: 'J. K. Rowling'
                      ),
                    ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Editora:',
                      style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15
                      ),
                    ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/10,
                  width: MediaQuery.of(context).size.width/1.1,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: editora,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        hintText: 'Rocco'
                      ),
                    ),
                ),
              
                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Condição:',
                      style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15
                      ),
                    ),
                ),
               
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Cores.cinza, width: 1)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value : item,
                        isExpanded: true,
                        iconSize: 30,
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) =>setState(()=> this.item = value as String),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Categoria:',
                      style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15
                      ),
                    ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Cores.cinza, width: 1)
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value : categoria,
                        isExpanded: true,
                        iconSize: 30,
                        items: categorias.map(buildMenuItem).toList(),
                        onChanged: (value) =>setState(()=> this.categoria = value as String),
                      ),
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Descrição',
                      style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15
                      ),
                    ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/10,
                  width: MediaQuery.of(context).size.width/1.1,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: descricao,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                      ),
                    ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width/1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Link para contato: ',
                      style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15
                      ),
                    ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/10,
                  width: MediaQuery.of(context).size.width/1.1,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: link,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                      ),
                    ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      height: MediaQuery.of(context).size.height/12,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Confirmado()
                            )
                          );
                        },
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                          color: Colors.white
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Cores.verdeAgua),
                          shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                          )
                        ),
                     ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) =>
    DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontSize: 20),
      ),
    );
    Future escolherFoto() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFoto() async {
    if (file == null) return;
    await FirebaseStorage.instance
        .ref('uploads/$email/books/${nome.text}')
        .putFile(file!);
    print("DEU CERTO POW");
  }
}