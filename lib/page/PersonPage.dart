import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PersonPageState();
  }

}
class PersonPageState extends State<PersonPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(child: Text("个人界面"),)
        ],
      ),
    );
  }

}