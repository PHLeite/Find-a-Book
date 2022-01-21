import 'package:find_a_book/core/cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Confirmado extends StatefulWidget {
  const Confirmado({ Key? key }) : super(key: key);

  @override
  _ConfirmadoState createState() => _ConfirmadoState();
}

class _ConfirmadoState extends State<Confirmado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width/6,
                  height: MediaQuery.of(context).size.width/6,
                  child: Icon(
                    Icons.emoji_emotions_outlined,
                    color: Cores.roxo,
                    size: 70,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Text(
                  'O livro foi',
                  style: TextStyle(
                    color: Cores.roxo,
                    fontWeight: FontWeight.w700,
                    fontSize: 40
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Text(
                  'cadastrado',
                  style: TextStyle(
                    color: Cores.roxo,
                    fontWeight: FontWeight.w800,
                    fontSize: 40
                  ),
                ),
              ),
            ),
             Center(
              child: Container(
                child: Text(
                  'com sucesso!',
                  style: TextStyle(
                    color: Cores.roxo,
                    fontWeight: FontWeight.w700,
                    fontSize: 40
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}