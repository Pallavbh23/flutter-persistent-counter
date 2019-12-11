import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The SlApp",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "The Slapp"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int _counter = 0;
String name = "Vipul";

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  changeName(newvalue) {
    setState(() {
      name = newvalue;
    });
  }

  _decrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) - 1;
      prefs.setInt('counter', _counter);
    });
  }
//  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter += 1;
//      if (_counter < 0) {
//        _counter = -_counter;
//      }
//    });
//  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
//      backgroundColor: Color.fromRGBO(12, 12, 12, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(44, 62, 80, 1),
//          backgroundColor: Color.alphaBlend(Color.fromRGBO(171,32,253, 1), Color.fromRGBO(21, 32, 12, 0.5)),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network("https://i.imgur.com/o1m1AAR.gif"),
            Padding(
              padding: const EdgeInsets.all(10),
            ),
            Text(
              'Amount of times $name needs to be slapped:',
//              style: Theme.of(context).textTheme.apply(bodyColor: Colors.white10),
              style: TextStyle(color: Colors.grey),
              textScaleFactor: 1.5,
            ),
            Text(
              '$_counter',
//              style: Theme.of(context).textTheme.display4,
              style: TextStyle(color: Colors.black45),
              textScaleFactor: 2.5,
            ),
            TextField(
              autofocus: true,
              autocorrect: true,
              onSubmitted: (_newvalue) {
                changeName(_newvalue);
              },
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Kill $name',
          child: Icon(
            Icons.arrow_upward,
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(44, 62, 80, 1)),
      persistentFooterButtons: <Widget>[
        MyButton(),
        new FloatingActionButton(
          onPressed: _decrementCounter,
          backgroundColor: Color.fromRGBO(44, 62, 80, 1),
          tooltip: "You're a loser for trying to save $name",
          child: Icon(Icons.accessible),
//          clipBehavior: prefix0.Clip.hardEdge,
        ),
      ],
//      drawer: MyHomePage(
//        title: "After slapping $_counter times",
//      ),
//      drawer: MyDrawer(
//        title: "After slapping $_counter times",
//      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//--------------------------------------------------------------------
//class MyDrawer extends StatefulWidget {
//  final String title;
//
//  MyDrawer({Key key, this.title}) : super(key: key);
//  @override
//  _MyDrawer createState() => _MyDrawer();
//}
//
//
//
//class _MyDrawer extends State<MyDrawer> {
//
//  @override
//  void initState() {
//    super.initState();
//    _loadCounter();
//  }
//
//  _loadCounter() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    setState(() {
//      _counter = (prefs.getInt('counter') ?? 0);
//    });
//  }
//
//  _incrementCounter() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    setState(() {
//      _counter = (prefs.getInt('counter') ?? 0) + 1;
//      prefs.setInt('counter', _counter);
//    });
//  }
//
//  @override
//
//}
//
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The InkWell wraps the custom flat button widget.
    return InkWell(
      // When the user taps the button, show a snackbar.
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              'Well done, fellow comrade! $name shall recive $_counter slaps.'),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(22.0),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromRGBO(44, 62, 80, 1),
        ),
        child: Text(
          'Tap Here',
          textScaleFactor: 1,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class MyButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The InkWell wraps the custom flat button widget.
    return InkWell(
      // When the user taps the button, show a snackbar.
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
              'What a loser, you just tried to reduce the amount of slaps...'),
        ));
      },
      child: Container(
        padding: EdgeInsets.all(22.0),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromRGBO(44, 62, 80, 1),
        ),
        child: Icon(
          Icons.accessible,
          color: Colors.white,
        ),
      ),
    );
  }
}
