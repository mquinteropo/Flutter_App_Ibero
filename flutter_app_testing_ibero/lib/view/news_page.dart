import 'package:flutter_app_testing_ibero/presenter/build_view.dart';
import 'package:flutter_app_testing_ibero/util/styles.dart';
import 'package:flutter_app_testing_ibero/view/widgets/drawer_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_testing_ibero/util/controllerFirebase.dart'
as firebaseAuth;

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int Newsint = 1;

  String viewName = 'NewsList';
  static const drawerOptions = <Map<String, dynamic>>[
    {
      'value': 1,
      'text':
          'All articles about Tesla from the last month, sorted by recent first'
    },
    {'value': 2, 'text': 'Top business headlines in the US right now'},
    {
      'value': 3,
      'text':
          'All articles mentioning Apple from yesterday, sorted by popular publishers first'
    },
    {'value': 4, 'text': 'Top headlines from TechCrunch right now'},
    {
      'value': 5,
      'text':
          'All articles published by the Wall Street Journal in the last 6 months, sorted by recent first'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'BIT News',
          style: TextStyle(color: Colors.black26),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.favorite),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Image.network(
                  'https://bit.institute/images/Instituto-Cursos-Programacion.png'),
            )),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ListTile(
              title: Text(
                'Cursos',
                style: Styles.drawerOptionStyle,
              ) ,
              onTap: (){
                Navigator.pushNamed(context, '/nosotros');
              },
            ),
            ListTile(
              title: Text(
                'News',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ...drawerOptions
                .map((option) => DrawerOption(
                      text: option['text'],
                      onTap: () {
                        setState(() {
                          Newsint = option['value'];
                          Navigator.pop(context);
                        });
                      },
                    ))
                .toList(),
            ListTile(
              title: Text(
                'Setting',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.close_rounded,),
              title: Text(
                'Sign Out',
                style: Styles.drawerOptionStyle,
              ) ,
              onTap: (){
                firebaseAuth.signOut(context);
              },

            )
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: BuildView(viewName: viewName, intNews: Newsint),
      ),
    );
  }
}
