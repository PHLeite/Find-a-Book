import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/chat/chatOpen.dart';
import 'package:flutter/material.dart';

class Quadrado extends StatefulWidget {
  final String foto;
  final String nome;
  final String book;
  const Quadrado({ Key? key, required this.foto, required this.nome, required this.book }) : super(key: key);

  @override
  _QuadradoState createState() => _QuadradoState();
}

class _QuadradoState extends State<Quadrado> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatOpen()
          )
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/7.7,
        child: Column(
          children: [
            Row(   
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 8, top: 5, bottom: 8),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(widget.foto),
                  ),
                ), 
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 0, right: 10, left: 30),
                      child: Container(
                        child: Text(
                          widget.nome,
                          style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: Text(
                          widget.book,
                          style: TextStyle(fontSize: 15, color: Cores.cinza),
                        ),
                      ),
                    ),
                  ],
                ) 
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Divider(
                color: Cores.cinza,
                thickness: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}