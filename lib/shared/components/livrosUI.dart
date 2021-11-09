import 'package:flutter/material.dart';

class LivrosUI extends StatelessWidget {
  const LivrosUI({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage("assets/images/perfil.jpg"),
              fit: BoxFit.cover
              )
            ),
          ),
        ],
      ),
    );
  }
}