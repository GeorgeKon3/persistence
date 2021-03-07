import 'package:flutter/material.dart';
import 'package:persistence_project/database_helper.dart';
import 'package:persistence_project/hair_color_screen.dart';

class WelcomeScreen extends StatelessWidget {
  bool isLogin;
  String name;

  //const WelcomeScreen({Key key, this.isLogin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              onChanged: (value) {
                name = value;
              },
              decoration: new InputDecoration(hintText: 'Enter your Name'),
              textAlign: TextAlign.center,
            ),
            // MaterialButton(
            //   color: Colors.blueAccent,
            //   onPressed: () {
            //     DatabaseHelper();
            //   },
            //   child: Text('Enter your Name'),
            // ),
            Padding(
              padding: EdgeInsets.only(left: 100, top: 40),
              child: MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HairColorScreen()),
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
