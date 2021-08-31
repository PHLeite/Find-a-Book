import 'package:find_a_book/core/cores.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/15,
              width: MediaQuery.of(context).size.width/2,
              child: TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment(-0.5, 0.0),
                  child: Text('Cadastre-se',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Cores.roxo)
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, -1.07),
              child: Container(
                height: MediaQuery.of(context).size.height/25,
                width: MediaQuery.of(context).size.width/8,
                color: Colors.white,
                transform: Matrix4.rotationZ(0.54),
              
              ),
            ),
            Align(
              alignment: Alignment(-0.1, -0.85),
              child: Container(
                height: MediaQuery.of(context).size.height/25,
                width: MediaQuery.of(context).size.width/8,
                color: Colors.white,
                transform: Matrix4.rotationZ(-0.54),
              
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.width/3,
                  color: Cores.laranja,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 240),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'FAB', 
                  style: TextStyle(
                    color: Cores.verdeAgua,
                    fontSize: 30,
                    fontWeight: FontWeight.w900
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 275),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Entre ou Cadastre-se', 
                  style: TextStyle(
                    color: Cores.verdeAgua,
                    fontSize: 25,
                    
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 325, left: 15),
              child: Text(
                'E-MAIL:',
                style: TextStyle(
                  color: Cores.roxo,
                  fontWeight: FontWeight.w800,
                  fontSize: 15
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 350, right: 15, left: 15),
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

             Padding(
              padding: EdgeInsets.only(top: 420, left: 15),
              child: Text(
                'SENHA:',
                style: TextStyle(
                  color: Cores.roxo,
                  fontWeight: FontWeight.w800,
                  fontSize: 15
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 445, right: 15, left: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  prefixIcon: Icon(Icons.vpn_key_rounded),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 500, right: 15),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {}, 
                  child: Text(
                    'Esqueci minha senha',
                    style: TextStyle(
                     fontSize: 12,
                      color: Cores.cinza,
                    ),
                  )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 535),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  height: MediaQuery.of(context).size.height/11,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Entrar',
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
              )
            ),

            Padding(
              padding: EdgeInsets.only(top: 595),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '2021 \u00a9 FindABook',
                  style: TextStyle(
                    color: Cores.cinza,
                    fontSize: 10
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}