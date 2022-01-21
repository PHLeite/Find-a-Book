import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:find_a_book/db/firestore.dart';
import 'package:find_a_book/services/auth.service.dart';
import 'package:flutter/cupertino.dart';

class PerfilRepository extends ChangeNotifier {
  late FirebaseFirestore db;
  late AuthService auth;

  PerfilRepository({required this.auth}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

/*   readNome() async {
    if (auth.usuario != null) {
      final nome = await db.collection('users/${auth.email}/nome').get();
      return nome;
    }
  }

  _readBooks() async {
    if (auth.usuario != null) {
      final snapshot = await db.collection('users/${auth.email}/livros').get();
      snapshot.docs.forEach((doc) {
        //Livro livro =
        //notifyListeners();
      });
    }
  } */

  /* remove(Livro livro) {
    await db
      .collection('users/${auth.email}')
      .doc('livros')
      .delete();
    //_lista.remove(livro);
    notifyListeners();
  } */
}
