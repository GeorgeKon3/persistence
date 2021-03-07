import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:persistence_project/welcome_screen.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: (User().isLogin == 1) ? MyHomePage() : WelcomeScreen());
  }
}

class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {},
                child: Text('Show name'),
              ),
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {},
                child: Text('Show hair color'),
              ),
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {},
                child: Text('Edit name'),
              ),
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {},
                child: Text('Edit hair color'),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
