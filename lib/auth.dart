import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends StatefulWidget {
  @override
  AuthState createState() => AuthState();
}

class AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Firebase Authentication App")),
        body: Column(children: <Widget>[
          RaisedButton(
              child: Text("Sign up"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignUp()));
              }),
          RaisedButton(
              child: Text("Sign in"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignIn()));
              })
        ]));
  }
}

class FirebaseUserRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseUserRepository({@required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<FirebaseUser> signUp(
      {@required String email, @required String password}) async {
    return _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<FirebaseUser> getCurrentUser() => _firebaseAuth.currentUser();

  Future<void> signOut() => _firebaseAuth.signOut();

  Future<FirebaseUser> signIn(
      {@required String email, @required String password}) async {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}

// This is sign up page
class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sign Up Page")),
        body: Column(children: <Widget>[
          RaisedButton(child: Text("Sign up"), onPressed: null),
          RaisedButton(child: Text("Sign in"), onPressed: null)
        ]));
  }
}

// This is sign in page
// This is sign up page
class SignIn extends StatefulWidget {
  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sign In Page")),
        body: Column(children: <Widget>[
          RaisedButton(child: Text("Sign up"), onPressed: null),
          RaisedButton(child: Text("Sign in"), onPressed: null)
        ]));
  }
}
