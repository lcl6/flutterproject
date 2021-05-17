import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ContentPageState();
  }
}
class ContentPageState extends State<ContentPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Text("内容界面"),
          )
        ],
      ),
    );
  }

}