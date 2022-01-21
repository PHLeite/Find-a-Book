import 'package:find_a_book/core/cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editar extends StatefulWidget {
  const Editar({ Key? key }) : super(key: key);

  @override
  _EditarState createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  final formKey = GlobalKey<FormState>();
  final senha = TextEditingController();
  final nome = TextEditingController();
  final bio = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
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
                  fontWeight: FontWeight.w900
                ),
              ),
            ),
          ),

          Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Editar foto de perfil:',
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
                        onPressed: () {},
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            hintText: 'Juliana Martins'),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            hintText: 'A leitura engrandece a alma'),
                      ),
                    ), 
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Editar Senha:',
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
                  Navigator.of(context).pop();   
                },
                child: Text(
                  'Editar',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    color: Colors.white
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Cores.verdeAgua),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}