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
            )
          
          ],
        ),
      ),
    );
  }
}