import 'package:flutter/material.dart';

class InfoPerfil extends StatefulWidget {
  final String num;
  final String name;
  const InfoPerfil(this.name, this.num, { Key? key }) : super(key: key);

  @override
  _InfoPerfilState createState() => _InfoPerfilState();
}

class _InfoPerfilState extends State<InfoPerfil> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: MediaQuery.of(context).size.width/3,
      child: Column(children: [
        Row(
        children: [Padding(
          padding: EdgeInsets.only(left: 30),
          child: Column(children: [
            Text(
              widget.num, 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18
              ),
            ),
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 14,
              ),
            )
          ],),
       )],
      )
      ],),
    );
  }
}