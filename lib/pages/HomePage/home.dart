import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/HomePage/search.dart';
import 'package:find_a_book/shared/components/categoriesUI.dart';
import 'package:find_a_book/shared/components/livrosUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference books = FirebaseFirestore.instance.collection('books');

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, 
   )
  );

    return Column(
      children: [
        Container(height: MediaQuery.of(context).size.height/25,),
        Center(
          child: Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Cores.verdeAgua,
                shape: StadiumBorder(),
                side: BorderSide(
                  color: Colors.white,
                ),
                fixedSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height / 20),
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Search()
                )
              ),
              child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.search, size: 20, color: Colors.white,)),
                  Text(
                    'Pesquisar',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white24,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Expanded(
          flex: 0,
          child: Container(
            width: MediaQuery.of(context).size.width*10,
            
            child: SingleChildScrollView(
              
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                Categorie(categoria: "Ficção"),
                Categorie(categoria: "Romance"),
                Categorie(categoria: "Biografia"),
                Categorie(categoria: "Infanto-Juvenis"),
                Categorie(categoria: "Brasileiros"),
                Categorie(categoria: "Poesias"),
                Categorie(categoria: "Contos"),
                Categorie(categoria: "Coleções"),
                Categorie(categoria: "Técnicos"),
                Categorie(categoria: "Auto Ajuda"),
                Categorie(categoria: "Religiosos"),
                Categorie(categoria: "Terror"),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height/40, 
          width: MediaQuery.of(context).size.width,
          color: Colors.white
        ),  
        Expanded(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child:  ListView(
              children: [
                FutureBuilder(
                            future: books.get(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                              if (snapshot.hasError) {
                                return Text("Something went wrong");
                              }

                              if (snapshot.hasData && snapshot.connectionState == ConnectionState.none) {
                                return Text("Document does not exist");
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator(
                                  color: Cores.roxo,
                                ));
                              }
                              else{
                                List<String> data =
                                    snapshot.data!.docs.map((e) => e.id).toList();
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        LivrosUI(livro: data[1], pag: 'home',),
                                        LivrosUI(livro: data[2], pag: 'home'),
                                      ],
                                    ),
                                  
                                Row(
                                  children: [
                                    LivrosUI(livro: data[3], pag: 'home'),
                                    LivrosUI(livro: data[4], pag: 'home'),
                                  ],
                                ),
                                ],
                                );
                              }
                            }),
              ],
            ),
            // child: StreamBuilder(
            //   stream: FirebaseFirestore.instance.collection('books').snapshots(),
            //   builder: (context,  AsyncSnapshot<QuerySnapshot> snapshot){
            //     if(snapshot.connectionState == ConnectionState.waiting){
            //       return Center(
            //         child: CircularProgressIndicator(
            //           color: Cores.roxo,
            //         )
            //       );
            //     }

            //     return ListView.builder(
            //       itemCount:  snapshot.data!.docs.length,
            //       //com isso da pra fazer o tanto de livro q tem lá no perfil!
            //       itemBuilder: (context, index) => LivrosUI(
            //         livro: snapshot.data!.docs.forEach((doc) { doc.id;})[index].data(),
            //         //livro: 'ms8b7CELRQzpFS2BjOAK', 
            //         pag:'home'
            //         /* QuerySnapshot querySnapshot = await _collectionRef   
            //                       .limit(1)
            //                       .orderBy('date')                                                                    
            //                       .getDocuments();
            //               var list = querySnapshot.documents;
            //               querySnapshot.documents[0].documentID
            //               querySnapshot.documents.map((document) { 
            //                   print('Document : $document'); // not printing anything.
            //                 });

            //               if(list.length > 0) {
            //                 print('ID : ${list[0].documentID}'); // not working
            //               } */
            //       )
            //     );
            //   },
            // ),
            // child: ListView(
            //   scrollDirection: Axis.vertical,
              
            //     children: [
            //       Row(
            //         children: [
            //           GestureDetector(  
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => EditarLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
            //                 )
            //               );
            //             },
            //           child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
            //           ),
            //           GestureDetector(  
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
            //                 )
            //               );
            //             },
            //           child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
            //           ),
                      
                     
            //         ],
            //       ),
            //        Row(
            //         children: [
            //           GestureDetector(  
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
            //                 )
            //               );
            //             },
            //           child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
            //           ),
            //           GestureDetector(  
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
            //                 )
            //               );
            //             },
            //           child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
            //           ),
                      
                     
            //         ],
            //       ),
            //        Row(
            //         children: [
            //           GestureDetector(  
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
            //                 )
            //               );
            //             },
            //           child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
            //           ),
            //           GestureDetector(  
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
            //                 )
            //               );
            //             },
            //           child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
            //           ),
                      
                     
            //         ],
            //       ),
            //        Row(
            //         children: [
            //           GestureDetector(  
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
            //                 )
            //               );
            //             },
            //           child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
            //           ),
            //           GestureDetector(  
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => PagLivro(livro: 'ms8b7CELRQzpFS2BjOAK')
            //                 )
            //               );
            //             },
            //           child: LivrosUI(livro: 'ms8b7CELRQzpFS2BjOAK'),
            //           ),
                      
                     
            //         ],
            //       ),
            //     ],
            //   ),
          ),
        ),
      ],
    );
  }
}
