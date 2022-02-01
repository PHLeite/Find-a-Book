import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/login/login.dart';
import 'package:find_a_book/services/auth.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Registre extends StatefulWidget {
  const Registre({Key? key}) : super(key: key);

  @override
  _RegistreState createState() => _RegistreState();
}

class _RegistreState extends State<Registre> {
  final formKey = GlobalKey<FormState>();
  final senha = TextEditingController();
  final email = TextEditingController();
  final nome = TextEditingController();
  final local = TextEditingController();
  final cool = 'ok';
  File? file;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  User? user = FirebaseAuth.instance.currentUser;

  bool loading = false;

  Future<void> registrar() async {
    try {
      setState(() => loading = true);
      await context.read<AuthService>().registrar(email.text, senha.text);
      users.doc(email.text).set({
        'bio': '',
        'nome': nome.text,
        'perfil': '',
        'linkZap': '',
        'livros': '',
        'email': email.text,
        'local': local.text,
      });
    } on AuthExeption catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height / 4.5,
                width: MediaQuery.of(context).size.width / 1.2,
                child: Text(
                  'CRIAR UMA NOVA CONTA',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Cores.verdeAgua,
                      fontSize: 50,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height / 25,
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      'Já tem registro? Clique aqui!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Cores.cinza,
                          fontSize: 10,
                          fontWeight: FontWeight.w900),
                    )),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Foto de perfil:',
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
                        'NOME:',
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
                            hintText: 'Juliana Martins'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'E-MAIL:',
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
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Esse campo é obrigatório!');
                          } else if (!value.contains("@")) {
                            return ('Esse e-mail não é válido!');
                          } else if (value.length < 5) {
                            return ('Esse e-mail está pequeno demais!');
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            prefixIcon: Icon(Icons.email_rounded),
                            hintText: 'exemplo@mail.com'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'SENHA:',
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
                        controller: senha,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('Esse campo é obrigatório!');
                          } else if (value.length < 5) {
                            return ('A senha deve ter no mínimo 6 caracteres!');
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            prefixIcon: Icon(Icons.lock),
                            hintText: '************'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'LOCALIZAÇÃO:',
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
                          /* else if (value.contains(RegExp(r'[A-Z]'))) {
                            return ('Esse campo deve conter apenas números ou /!');
                          } else if (value.contains(RegExp(r'[a-z]'))) {
                            return ('Esse campo deve conter apenas números ou /!');
                          } else if (value.length != 10) {
                            return ('O formato é dd/mm/yyyy!');
                          } */
                        },
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            prefixIcon: Icon(Icons.location_on_sharp),
                            hintText: 'São Paulo'),
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
                      if (formKey.currentState!.validate()) {
                        if (loading == true) {
                          Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          registrar();
                          uploadFoto();
                        }
                      }
                      /* if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage())); */
                    },
                    child: Text(
                      'Registrar-se',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Cores.verdeAgua),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 15,
                alignment: Alignment.bottomCenter,
                child: Text(
                  '2021 \u00a9 FindABook',
                  style: TextStyle(color: Cores.cinza, fontSize: 10),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  loadingScreen() {
    return Center(
      child: CircularProgressIndicator(
        color: Cores.verdeAgua,
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
        .ref('uploads/${email.text}/fotoDePerfil')
        .putFile(file!);
    print("DEU CERTO POW");
  }
}
