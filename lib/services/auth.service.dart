import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthExeption implements Exception {
  String message;
  AuthExeption(this.message);
}

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  //String? email = FirebaseAuth.instance.currentUser!.email;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  getCurrentUser() async {
    return usuario;
  }

  registrar(String email, String senha) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
      logout();
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw AuthExeption('Este email já está em uso');
      }
    }
  }

  login(String email, String senha) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthExeption('Email não encontrado. Cadastre-se');
      } else if (e.code == 'wrong-password') {
        throw AuthExeption('Senha incorreta. Tente novamente');
      }
    }
  }

  logout() async {
    await _auth.signOut();
    usuario = null;
    _getUser();
  }
}
