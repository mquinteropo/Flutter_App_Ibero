import 'package:flutter/material.dart';
import 'package:flutter_app_testing_ibero/view/login_page.dart';
import 'package:flutter_app_testing_ibero/view/news_page.dart';
import 'package:flutter_app_testing_ibero/view/home.dart';
import 'package:flutter_app_testing_ibero/view/register.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// clase principal
class MyApp extends StatefulWidget {
  //WidgetsFlutterBinding.ensureInitialized();
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => new LoginPage());
          case '/news':
            return MaterialPageRoute(builder: (context) => new NewsPage());
          case '/register':
            return MaterialPageRoute(builder: (context) => new RegisterUser());
          case '/nosotros':
            return MaterialPageRoute(builder: (context) => new Home());
          default:
            return null;
        }
      },
    );
  }
}
