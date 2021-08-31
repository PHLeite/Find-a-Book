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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child:CustomPaint(
              painter: SetaRoxa(),
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Cadastre-se',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      color: Colors.white
                    ),
                    ),
                    ),
                  ),
                ),
          
          Padding(
            padding: const EdgeInsets.all(30),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width/3,
                height: MediaQuery.of(context).size.width/3,
                color: Cores.laranja,
              ),
            ),
          ),

            Align(
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

            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Entre ou Cadastre-se', 
                style: TextStyle(
                  color: Cores.verdeAgua,
                  fontSize: 20,
                  
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(15),
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
              padding: const EdgeInsets.all(15),
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
              padding: EdgeInsets.all(15),
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
              padding: const EdgeInsets.all(5),
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
              padding: EdgeInsets.all(1),
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
              padding: EdgeInsets.all(15),
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
              padding: EdgeInsets.all(15),
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
    );
  }
}

class SetaRoxa extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint_0 = new Paint()
      ..color = Cores.roxo
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path_0 = Path();
    path_0.moveTo(0,size.height);
    path_0.lineTo(0,0);
    path_0.lineTo(size.width*0.7944444,0);
    path_0.lineTo(size.width*1.2,size.height*0.4921875);
    path_0.lineTo(size.width*0.7967593,size.height);
    path_0.lineTo(0,size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
