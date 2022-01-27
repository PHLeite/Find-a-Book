import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class EditarLivro extends StatefulWidget {
  final String livro;
  const EditarLivro({ Key? key, required this.livro }) : super(key: key);

  @override
  _EditarLivroState createState() => _EditarLivroState();
}

class _EditarLivroState extends State<EditarLivro> {
  CollectionReference books = FirebaseFirestore.instance.collection('books');
  String? email = '';
  final formKey = GlobalKey<FormState>();
  final items = ['Novo', 'Usado'];
  String item = "Usado";
  String categoria = "Romance";
  final categorias = [
    "Ficção",
    "Romance",
    "Biografia",
    "Infanto-Juvenis",
    "Brasileiros",
    "Poesias",
    "Contos",
    "Coleções",
    "Técnicos",
    "Auto Ajuda",
    "Religiosos",
    "Terror"
  ];
  String? value;
  File? file;
  final nome = TextEditingController();
  final autor = TextEditingController();
  final editora = TextEditingController();
  final link = TextEditingController();
  final descricao = TextEditingController();
  final valor = TextEditingController();
  String? documentID = '';

  updateLivro() async {
    if (nome.text != '') {
      await books.doc(widget.livro).update({'nome': nome.text});
    }
    if (autor.text != '') {
      await books.doc(widget.livro).update({'autor': autor.text});
    }
    if (editora.text != '') {
      await books.doc(widget.livro).update({'editora': editora.text});
    }
    if (link.text != '') {
      await books.doc(widget.livro).update({'link': link.text});
    }
    if (valor.text != '') {
      await books.doc(widget.livro).update({'valor': valor.text});
    }
    if (descricao.text != '') {
      await books.doc(widget.livro).update({'descricao': descricao.text});
    }
    if (file != null) {
      uploadFoto();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Container(
                  width: MediaQuery.of(context).size.width / 7,
                  height: MediaQuery.of(context).size.width / 7,
                  decoration: BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(100)),
                      color: Cores.verdeAgua),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )),
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height / 4.5,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Text(
                      'EDITAR LIVRO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Cores.verdeAgua,
                          fontSize: 45,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width / 1.2,
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     'Editar foto do livro:',
                //     style: TextStyle(
                //         color: Cores.roxo,
                //         fontWeight: FontWeight.w800,
                //         fontSize: 15),
                //   ),
                // ),
                // Container(
                //   width: MediaQuery.of(context).size.width / 5,
                //   height: MediaQuery.of(context).size.width / 5,
                //   child: FloatingActionButton(
                //     backgroundColor: Cores.azul,
                //     onPressed: () {
                //       escolherFoto();
                //     },
                //     child: Icon(
                //       Icons.add_a_photo,
                //       color: Colors.white,
                //       size: 40,
                //     ),
                //   ),
                // ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Editar nome do livro:',
                    style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 1.1,
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: nome,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('Esse campo é obrigatório!');
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: 'Harry Potter'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Autor:',
                    style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 1.1,
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: autor,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('Esse campo é obrigatório!');
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: 'J. K. Rowling'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Editora:',
                    style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 1.1,
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: editora,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('Esse campo é obrigatório!');
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: 'Rocco'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Valor:',
                    style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 1.1,
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: valor,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('Esse campo é obrigatório!');
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintText: 'R\$30,00'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Condição:',
                    style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Cores.cinza, width: 1)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: item,
                        isExpanded: true,
                        iconSize: 30,
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.item = value as String),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Categoria:',
                    style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Cores.cinza, width: 1)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: categoria,
                        isExpanded: true,
                        iconSize: 30,
                        items: categorias.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.categoria = value as String),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Descrição',
                    style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 1.1,
                  alignment: Alignment.center,
                  child: TextFormField(
                    controller: descricao,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('Esse campo é obrigatório!');
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Link para contato: ',
                    style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 1.1,
                  alignment: Alignment.center,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('Esse campo é obrigatório!');
                      }
                    },
                    controller: link,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 12,
                      child: TextButton(
                        onPressed: () {
                            updateLivro();
                            Navigator.of(context).pop();          
                        },
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Cores.verdeAgua),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ))),
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

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 20),
        ),
      );

      Future escolherFoto() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFoto() async {
    if (file == null) return;
    await FirebaseStorage.instance
        .ref('uploads/$email/fotoDePerfil')
        .putFile(file!);
    print("DEU CERTO POW");
  }
}