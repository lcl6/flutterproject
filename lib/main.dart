import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterdemo/page/ContentPage.dart';
import 'package:flutterdemo/page/HomePage.dart';
import 'package:flutterdemo/page/PersonPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp();

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabPage(),
    );
  }
}

class TabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TabPageState();
  }
}

class TabPageState extends State<TabPage> {
  int _selectIndex = 0;
  List<Widget> pageList = [HomePage(), ContentPage(), PersonPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试商城"),
      ),
      body: pageList[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _getBotton(_selectIndex),
        onTap: (flag) {
          _onItemTabpped(flag);
        },
        currentIndex: _selectIndex,
      ),
    );
  }

  List<BottomNavigationBarItem> _getBotton(int index) {
    List<BottomNavigationBarItem> list = List<BottomNavigationBarItem>();
    list.add(BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon:_getImage(index,0),
        // icon: Icon(Icons.print),
        title: Text('首页')));
    list.add(BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon:_getImage(index,1),
        // icon: Icon(Icons.print),
        title: Text('内容')));
    list.add(BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: _getImage(index,2),
        // icon: Icon(Icons.print),
        title: Text('个人')));
    return list;
  }

  Image _getImage(int index,int type){
    Image img;
    switch(type){
      case 0:
        img= Image(
          width: index == 0 ? 25 : 20,
          height: index == 0 ? 25 : 20,
          image: index == 0
              ? AssetImage("assets/icons/one_sel.png")
              : AssetImage("assets/icons/one.png"),
        );
        break;
      case 1:
        img= Image(
          width: index == 1 ? 25 : 20,
          height: index == 1 ? 25 : 20,
          image: index == 1
              ? AssetImage("assets/icons/tree_sel.png")
              : AssetImage("assets/icons/tree.png"),
        );
        break;
      case 2:
        img=  Image(
          width: index == 2 ? 25 : 20,
          height: index == 2 ? 25 : 20,
          image: index == 2
              ? AssetImage("assets/icons/five_sel.png")
              : AssetImage("assets/icons/five.png"),
        );
        break;
    }
    return img;

  }


  /// tab选中事件
  void _onItemTabpped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
