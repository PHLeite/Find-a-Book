import 'package:find_a_book/pages/livro/Paglivro.dart';
import 'package:flutter/material.dart';

class LivrosUI extends StatelessWidget {
  final String photo;
  final String preco;
  const LivrosUI({ Key? key, required this.photo, required this.preco}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width/15, 
        bottom: MediaQuery.of(context).size.height/40,
        top: 0
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => PagLivro()
          ));
        },
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/3.64,
              width: MediaQuery.of(context).size.width/2.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage(photo),
                fit: BoxFit.cover
                )
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/3,
              child: Text(preco,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Colors.black
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}