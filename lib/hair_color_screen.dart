import 'package:flutter/material.dart';
import 'package:persistence_project/main.dart';

import 'database_helper.dart';

class HairColorScreen extends StatelessWidget {
  final name;
  String hairColor;

  HairColorScreen({Key key, this.name});

  //const HairColorScreen({Key key, this.isLogin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose your hair color',
              style: TextStyle(fontSize: 20),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                hairColor = 'blonde';
              },
              child: Text('Blonde'),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                hairColor = 'brown';
              },
              child: Text('Brown'),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                hairColor = 'other';
              },
              child: Text('Other'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 100, top: 40),
              child: MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {
                  var user =
                      User(id: 0, name: name, hairColor: hairColor, isLogin: 1);
                  DatabaseHelper(user);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Text('Next'),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
