import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/core/imagens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({ Key? key }) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: 

      ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/4,
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
                'Carla Uihysei',
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
                  color: Cores.cinza,
                  fontWeight: FontWeight.w700,
                  fontSize: 15
                ),
              ),
            ),
          ),

          Container(
            
          )
        ],
      ),
    );
  }
}