import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:hybrid_manager/hybrid_stack_manager_plugin.dart';
import 'homePage.dart';
import 'value_color.dart';


//void main() => runApp(MyApp());
void main() async {

  String route = ui.window.defaultRouteName;
  Map params = await WCXRouter.getMainEntryParams();
  print("原生数据：" + route);
  print("params：" + params.toString());
  runApp(new MaterialApp(
    initialRoute: '/',
      routes: <String, WidgetBuilder>{
        route: (BuildContext context) =>
            _widgetForRoute(route, params),
      }, home: new HomePage()
  ));
}

Widget _widgetForRoute(String route, Map params) {
  switch (route) {
    case "/test":
      return new MyHomePage(params:params);
    default:
      return new HomePage();
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, Map params}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
//    setState(() {
//      // This call to setState tells the Flutter framework that something has
//      // changed in this State, which causes it to rerun the build method below
//      // so that the display can reflect the updated values. If we changed
//      // _counter without calling setState(), then the build method would not be
//      // called again, and so nothing would appear to happen.
//      _counter++;
//    });

//    WCXRouter.pop();
    //请求网络
    Map params = {"key":"value"};
    WCXHTTPResquest.sendRequestWithURL("url", params, (String response, String error){
      print("response:"+response);

      WCXRouter.openNativeWithURL(url: "/ViewController", params:{"a-a":response});
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: const Color(MyColors.color_0xFFFFFF),
        elevation: 0.0,
        centerTitle: true,
        brightness: Brightness.light, //控制状态栏的颜色，lignt 文字是灰色的，dark是白色的
        leading: new Container(
          margin: const EdgeInsets.only(left: 0),
          child: new IconButton(
            alignment: Alignment.centerLeft,
            splashColor: Color(0xffffff),
            highlightColor: Color(0xffffff),
            icon: new ImageIcon(
              new AssetImage("images/back.png"),
              size: 20,
              color: Color(0xFF353f5e),
            ),
            onPressed: () {
              WCXRouter.pop();
            },
          ),
        ),
        title: const Text(
          'title',
          style: TextStyle(
              color: Color(MyColors.color_0x353f5e),
              fontSize: 15,
              fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
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
