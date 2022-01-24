
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/perfil/editarperfil.dart';
import 'package:find_a_book/services/auth.service.dart';
import 'package:find_a_book/shared/components/livrosUI.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String? email = FirebaseAuth.instance.currentUser!.email;
  String path = '';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(email).get(),
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
            if(path == ''){
              printUrl();
            }
            return Scaffold(
              backgroundColor: Colors.white,
              body: ListView(
                children: [
                  Container(
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.height / 5,
                        height: MediaQuery.of(context).size.height / 5,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage: NetworkImage(path),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Text(
                        data['nome'],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 28),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 15, left: 15, bottom: 5),
                          child: Container(
                            child: Icon(
                              Icons.location_on,
                              color: Cores.cinza,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            child: Text(
                              data['local'],
                              style:
                                  TextStyle(color: Cores.cinza, fontSize: 13),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        child: Text(
                          data['bio'],
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Cores.azul,
                          shape: StadiumBorder(),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                          fixedSize: Size(MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height / 20),
                        ),
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Editar())),
                        child: Center(
                          child: Text(
                            'Editar Perfil',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15, left: 15, right: 15),
                      child: OutlinedButton(
                        onPressed: () => context.read<AuthService>().logout(),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.red[200],
                            shape: StadiumBorder(),
                            fixedSize: Size(MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height / 20)),
                        child: Center(
                          child: Text(
                            'Sair',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(child: Column(children: [
                        Text(
                '3', 
                style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 18
                ),
              ),
              Text(
                'A venda',
                style: TextStyle(
                    fontSize: 14,
                ),
              )
                      ],))
                    ),
                  ),
                  
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        child: Text(
                          'LIVROS',
                          style: TextStyle(
                              fontSize: 20,
                              color: Cores.roxo,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      LivrosUI(
                          photo: "assets/images/livro1.jpg", preco: "39,90"),
                      LivrosUI(
                          photo: "assets/images/livro2.jpg", preco: "15,90"),
                    ],
                  ),
                  Row(
                    children: [
                      LivrosUI(
                          photo: "assets/images/livro3.jpg", preco: "29,90"),
                      LivrosUI(
                          photo: "assets/images/livro4.jpg", preco: "69,90"),
                    ],
                  ),
                ],
              ),
            );
            /* Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.height / 5,
                height: MediaQuery.of(context).size.height / 5,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        'https://voxnews.com.br/wp-content/uploads/2017/04/unnamed.png'),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              child: Text(
                "Pedro Leite",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 28),
              ),
            ),
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 15, left: 15, bottom: 5),
                  child: Container(
                    child: Icon(
                      Icons.location_on,
                      color: Cores.cinza,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    child: Text(
                      'Divinópolis-MG',
                      style: TextStyle(color: Cores.cinza, fontSize: 13),
                    ),
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                child: Text(
                  'A leitura engrandece a alma',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Cores.azul,
                  shape: StadiumBorder(),
                  side: BorderSide(
                    color: Colors.white,
                  ),
                  fixedSize: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height / 20),
                ),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Editar())),
                child: Center(
                  child: Text(
                    'Editar Perfil',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
              child: OutlinedButton(
                onPressed: () => context.read<AuthService>().logout(),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.red[200],
                    shape: StadiumBorder(),
                    fixedSize: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height / 20)),
                child: Center(
                  child: Text(
                    'Sair',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              InfoPerfil('seguidores', '26K'),
              InfoPerfil('Vendas', '255'),
              InfoPerfil('A venda', '28'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Divider(
              height: 1,
              thickness: 0.1,
              color: Cores.cinza,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                child: Text(
                  'LIVROS',
                  style: TextStyle(
                      fontSize: 20,
                      color: Cores.roxo,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          Row(
            children: [
              LivrosUI(photo: "assets/images/livro1.jpg", preco: "39,90"),
              LivrosUI(photo: "assets/images/livro2.jpg", preco: "15,90"),
            ],
          ),
          Row(
            children: [
              LivrosUI(photo: "assets/images/livro3.jpg", preco: "29,90"),
              LivrosUI(photo: "assets/images/livro4.jpg", preco: "69,90"),
            ],
          ),
        ],
      ),
    ); */
          }
        });
  }

  printUrl() async {
    try{
      var ref = FirebaseStorage.instance.ref().child('uploads/$email/fotoDePerfil');
     String url = (await ref.getDownloadURL()).toString();
     print("$url");
      if(url != ''){
        setState(() {
          path = url;
        });
      }else{
        print("Deu bosta");
        setState(() {
          path = 'https://voxnews.com.br/wp-content/uploads/2017/04/unnamed.png';
        });
      }
    } on Exception catch (e){
      setState(() {
          path = 'https://voxnews.com.br/wp-content/uploads/2017/04/unnamed.png';
        });
      print("Deu merda");
    }
  }
}
