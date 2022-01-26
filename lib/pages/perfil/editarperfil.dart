import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editar extends StatefulWidget {
  const Editar({Key? key}) : super(key: key);

  @override
  _EditarState createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String? email = FirebaseAuth.instance.currentUser!.email;
  final formKey = GlobalKey<FormState>();

  final local = TextEditingController();
  final nome = TextEditingController();
  final bio = TextEditingController();
  File? file;

  bool loading = false;

  updatePerfil() async {
    if (local.text != '') {
      await users.doc(email).update({'local': local.text});
    }
    if (bio.text != '') {
      await users.doc(email).update({'bio': bio.text});
    }
    if (nome.text != '') {
      await users.doc(email).update({'nome': nome.text});
    }
    if (file != null) {
      uploadFoto();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height / 4.5,
              width: MediaQuery.of(context).size.width / 1.2,
              child: Text(
                'Editar perfil',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Cores.verdeAgua,
                    fontSize: 50,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Editar foto de perfil:',
                    style: TextStyle(
                        color: Cores.roxo,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.width / 5,
                  child: FloatingActionButton(
                    backgroundColor: Cores.azul,
                    onPressed: () {
                      escolherFoto();
                    },
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nome:',
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
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Bio:',
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
                    controller: bio,
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
                    'Local: ',
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
                    controller: local,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ('Esse campo é obrigatório!');
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      prefixIcon: Icon(Icons.location_on_sharp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 12.5,
              child: ElevatedButton(
                onPressed: () {
                  updatePerfil();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Editar',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Cores.verdeAgua),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ))),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
