
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/shared/components/livrosUI.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerfilView extends StatefulWidget {
  final String email;
  const PerfilView({Key? key, required this.email}) : super(key: key);

  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  
  String path = '';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(widget.email).get(),
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
                  Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width/7,
                  height: MediaQuery.of(context).size.width/7,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(new Radius.circular(100)),
                    color: Cores.verdeAgua
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ),
              ),
            ),
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
                         livro: '5iyGvcedIplSbnD506Ld'),
                      LivrosUI(
                          livro: '5iyGvcedIplSbnD506Ld'),
                    ],
                  ),
                  Row(
                    children: [
                      LivrosUI(
                         livro: '5iyGvcedIplSbnD506Ld'),
                      LivrosUI(
                          livro: '5iyGvcedIplSbnD506Ld'),
                    ],
                  ),
                ],
              ),
            );
           
          }
        });
  }

  printUrl() async {
    try{
      var ref = FirebaseStorage.instance.ref().child('uploads/$widget.email/fotoDePerfil');
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
