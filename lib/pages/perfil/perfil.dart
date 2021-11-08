import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/core/imagens.dart';
import 'package:find_a_book/pages/perfil/controller/info_perfil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({ Key? key }) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final String texto = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: 

      ListView(
        children: [
          Container(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.height/4,
                height: MediaQuery.of(context).size.height/4,
                child: Padding(
                   padding: const EdgeInsets.all(15),
                    child: Stack( //Para os componentes ficarem um emcima do outro
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(Imagens.fotoPerfil),
                        ),
                                
                      
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 35,
                            height: 35,
                            child: FloatingActionButton(
                              backgroundColor: Cores.cinza,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                                onPressed: null,
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
            ),
          ),

          Center(
            child: Container(
              child: Text(
                texto,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 28
                ),
              ),
            ),
          ),

          Center(
            child: Container(
              child: Text(
                'VENDEDORA',
                style: TextStyle(
                  color: Cores.roxo,
                  fontWeight: FontWeight.w700,
                  fontSize: 15
                ),
              ),
            ),
          ),

          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 15, left: 15, bottom: 5),
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
                child: Container(
                  child: Text(
                    'Divinópolis-MG',
                    style: TextStyle(
                      color: Cores.cinza,
                      fontSize: 13
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
                  style: TextStyle(
                    fontSize: 14
                  ),
                ),
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/20,
                decoration: BoxDecoration(
                  color: Cores.azul,
                  borderRadius: new BorderRadius.all(new Radius.circular(100.0)),
                ),

                child: Center(
                  child: Text(
                    'Editar Perfil',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                    ),
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
              color:  Cores.cinza,
            ),
          ),

          Center(
            child: Container(
              child: Text(
                'LIVROS',
                style: TextStyle(
                  fontSize: 20,
                  color: Cores.roxo,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}