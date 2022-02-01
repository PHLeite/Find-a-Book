import 'package:find_a_book/core/cores.dart';
import 'package:find_a_book/pages/registre/registre.dart';
import 'package:find_a_book/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final senha = TextEditingController();
  final email = TextEditingController();
  bool loading = false;

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthExeption catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: CustomPaint(
                    painter: SetaRoxa(),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Registre()));
                      },
                      child: Text(
                        'Cadastre-se',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 4,
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/F.png',
                  ),
                ),
              ),
              Container(
                child: Text(
                  'FAB',
                  style: TextStyle(
                      color: Cores.verdeAgua,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height / 10,
                child: Text(
                  'Entre ou Cadastre-se',
                  style: TextStyle(
                    color: Cores.verdeAgua,
                    fontSize: 20,
                  ),
                ),
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'E-MAIL:',
                          style: TextStyle(
                              color: Cores.roxo,
                              fontWeight: FontWeight.w800,
                              fontSize: 15),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 1.1,
                        alignment: Alignment.center,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ('Esse campo é obrigatório');
                            } else if (!value.contains("@")) {
                              return ('Esse e-mail não é válido!');
                            } else if (value.length < 5) {
                              return ('Esse e-mail está pequeno demais!');
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              prefixIcon: Icon(Icons.email_rounded),
                              hintText: 'exemplo@mail.com'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'SENHA:',
                            style: TextStyle(
                                color: Cores.roxo,
                                fontWeight: FontWeight.w800,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 1.1,
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: senha,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ('Esse campo é obrigatório!');
                            } else if (value.length < 5) {
                              return ('A senha deve ter no mínimo 6 caracteres!');
                            }
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              prefixIcon: Icon(Icons.lock),
                              hintText: '************'),
                        ),
                      ),
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 25,
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Esqueci minha senha',
                      style: TextStyle(
                        fontSize: 12,
                        color: Cores.cinza,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 12.5,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (loading == true) {
                          Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          login();
                        }
                      }
                      /* if (formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      } */
                    },
                    child: Text(
                      'Entrar',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                          color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Cores.verdeAgua),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ))),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 15,
                alignment: Alignment.bottomCenter,
                child: Text(
                  '2021 \u00a9 FindABook',
                  style: TextStyle(color: Cores.cinza, fontSize: 10),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SetaRoxa extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Cores.roxo
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width * 0.8944444, 0);
    path_0.lineTo(size.width * 1.2, size.height * 0.4921875);
    path_0.lineTo(size.width * 0.8967593, size.height);
    path_0.lineTo(0, size.height);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
