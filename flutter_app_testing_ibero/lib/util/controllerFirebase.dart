import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_testing_ibero/view/login_page.dart';

void Initialing() async {
  await Firebase.initializeApp();
}

void stateFirebase(context) {
  FirebaseAuth.instance.authStateChanges().listen((User user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
      Navigator.pushNamed(context, '/news');
    }
  });
}

void signIn(@required user, @required password, @required context) async {
  await FirebaseAuth.instance.signOut();
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: user, password: password);
  } on FirebaseAuthException catch (e) {
    showMaterialDialog(context: context, message: e.code);
  }
}

void signUp(@required user, @required password, @required context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: user, password: password);
  } on FirebaseAuthException catch (e) {
    showMaterialDialog(context: context, message: e.code);
  } catch (e) {
    print(e);
  }
}

void signOut(@required context) async {
  await FirebaseAuth.instance.signOut();
  //Navigator.pushNamed(context, '/login');
  Navigator.pushNamedAndRemoveUntil(context, "/login", (r) => false);
  /*
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
  );
  */
}
verifyEmail() async{
  User user = FirebaseAuth.instance.currentUser;

  if (!user.emailVerified) {
    await user.sendEmailVerification();
  }
}

showMaterialDialog({@required context, @required String message}) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            title: new Text("¡Advertencia!"),
            content: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ));
}
