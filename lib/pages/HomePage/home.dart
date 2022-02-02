import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/HomePage/search.dart';
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
// class Categ{
//   late final String categoria;

//   Categ(this.categoria);

//   setCategoria(String categs){
//     categoria = categs;
//   }
// }
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchController = TextEditingController();
  String query= "";
  String camp = 'tudo';
  bool isPesquisa = false;
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
                    suffixIcon:IconButton(onPressed: () {
                      searchController.clear();
                      setState(() {
                        camp = 'tudo';
                        query = "";
                        isPesquisa = false;
                      });
                    }, icon: Icon(Icons.cancel_outlined, color: Colors.white)),
                     /* suffixIcon:searchController.text.length>0 ? new IconButton(onPressed: () {
                      searchController.clear();
                      setState(() {
                        camp = 'tudo';
                        query = "";
                        isPesquisa = false;
                      });
                    }, icon: Icon(Icons.cancel_outlined, color: Colors.white)):new Container(height: 0.0,width: 0.0,), */
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
                  onFieldSubmitted: (String pesquisa){
                    
                    setState(() {
                      camp = 'caseSearch';
                      query = pesquisa;
                      isPesquisa = true;
                    });
                  }
                ),
              )
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
                CategoriaButton( "Todos"),
                CategoriaButton( "Ficção"),
                CategoriaButton( "Romance"),
                CategoriaButton( "Biografia"),
                CategoriaButton( "Infanto-Juvenis"),
                CategoriaButton( "Brasileiros"),
                CategoriaButton( "Poesias"),
                CategoriaButton( "Contos"),
                CategoriaButton( "Coleções"),
                CategoriaButton( "Técnicos"),
                CategoriaButton( "Auto Ajuda"),
                CategoriaButton( "Religiosos"),
                CategoriaButton( "Terror"),
                
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
            child:  FutureBuilder(   
                        future: Query(),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                          if (snapshot.hasError) {
                            return Text("Something went wrong");
                          }

                          if (snapshot.data!.docs.length == 0) {
                            return Text("Não existem livros cadastrados");
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: Cores.roxo,
                            ));
                          }
                          else{
                            List<String> data = snapshot.data!.docs.map((e) => e.id).toList();
                            return GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.72,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                ),
                                itemCount: data.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return LivrosUI(livro: data[index], pag: 'home');
                              });
                          }
                        }),
          ),
        ),
      ],
    );
  }
  CategoriaButton(String categoriaText){
    return GestureDetector(
      onTap: () {
        if(categoriaText == "Todos"){
          setState(() {
          query = "";
          camp = 'tudo';
          isPesquisa=false;
        });
        }else{
          setState(() {
          camp='categoria';
          query = categoriaText;          
          isPesquisa=false;

        });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3.8,
        alignment: Alignment.center,
        child: Container(
          width: MediaQuery.of(context).size.width / 4.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Cores.laranja,
          ),
          height: MediaQuery.of(context).size.height / 25,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              categoriaText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<QuerySnapshot<Object?>> Query() async{
    if(isPesquisa == true){
      print(query);
      return await books.where(camp, arrayContains: query).get();
    }else{
      return await books.where(camp, isEqualTo: query).get();
    } 
  }
}
