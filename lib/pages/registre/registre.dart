import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/home/index.dart';
import 'package:find_a_book/pages/login/login.dart';
import 'package:flutter/material.dart';

class Registre extends StatefulWidget {
  const Registre({ Key? key }) : super(key: key);

  @override
  _RegistreState createState() => _RegistreState();
}

class _RegistreState extends State<Registre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height/4.5,
            width: MediaQuery.of(context).size.width/1.2,
            child: Text(
                'CRIAR UMA NOVA CONTA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Cores.verdeAgua,
                  fontSize: 50,
                  fontWeight: FontWeight.w900
                ),
              ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height/25,
            width: MediaQuery.of(context).size.width/1.2,
            child: TextButton(onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Login()
                )
              );
            },
                child: Text('Já tem registro? Clique aqui!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Cores.verdeAgua,
                  fontSize: 10,
                  fontWeight: FontWeight.w900
                ),
                )
              ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/1.2,
            alignment: Alignment.centerLeft,
            child: Text(
                'NOME:',
                style: TextStyle(
                  color: Cores.roxo,
                  fontWeight: FontWeight.w800,
                  fontSize: 15
                ),
              ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/10,
            width: MediaQuery.of(context).size.width/1.1,
            alignment: Alignment.center,
            child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  hintText: 'Juliana Martins'
                ),
              ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/1.2,
            alignment: Alignment.centerLeft,
            child: Text(
                'E-MAIL:',
                style: TextStyle(
                  color: Cores.roxo,
                  fontWeight: FontWeight.w800,
                  fontSize: 15
                ),
              ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/10,
            width: MediaQuery.of(context).size.width/1.1,
            alignment: Alignment.center,
            child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  prefixIcon: Icon(Icons.email_rounded),
                  hintText: 'exemplo@mail.com'
                ),
              ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/1.2,
            alignment: Alignment.centerLeft,
            child: Text(
                'SENHA:',
                style: TextStyle(
                  color: Cores.roxo,
                  fontWeight: FontWeight.w800,
                  fontSize: 15
                ),
              ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/10,
            width: MediaQuery.of(context).size.width/1.1,
            alignment: Alignment.center,
            child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  prefixIcon: Icon(Icons.lock),
                  hintText: '************'
                ),
              ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/1.2,
            alignment: Alignment.centerLeft,
            child: Text(
                'ANIVESÁRIO:',
                style: TextStyle(
                  color: Cores.roxo,
                  fontWeight: FontWeight.w800,
                  fontSize: 15
                ),
              ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/10,
            width: MediaQuery.of(context).size.width/1.1,
            alignment: Alignment.center,
            child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  prefixIcon: Icon(Icons.calendar_today),
                  hintText: 'dd/mm/yyy'
                ),
              ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/1.5,
            height: MediaQuery.of(context).size.height/11,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage()
                  )
                );
              },
              child: Text(
                'Registrar-se',
                style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w800,
                color: Colors.white
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Cores.verdeAgua),
                shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                )
                )
              ),
           ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/10,
            alignment: Alignment.bottomCenter,
            child: Text(
                  '2021 \u00a9 FindABook',
                  style: TextStyle(
                    color: Cores.cinza,
                    fontSize: 10
                  ),
                ),
          )
        ],
      ),
    );
  }
}