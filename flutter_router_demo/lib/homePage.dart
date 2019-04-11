import 'package:flutter/material.dart';
import 'package:flutter_router_demo/value_color.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePagePageState();
  }
}

class HomePagePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Scaffold(
          backgroundColor: Color(MyColors.color_0xF4F7FC),
          body: new Container(
            color: Color(MyColors.color_0xFFFFFF),
            child: buildEnrollData(context),
          ),
        )
      ],
    );

  }

  Widget buildEnrollData(BuildContext context) {
    Widget widget = new Padding(
      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.0),
      child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'images/icon_empty.png',
                height: 60,
                width: 60,
              ),
              new GestureDetector(
                child: new SizedBox(
                    height: 50.0,
                    child: new Text(
                      '暂无数据～',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          color: Color(MyColors.color_0xe7e7e7)
                      ),
                    )),
                onTap: () {
                },
              ),
            ],
          )),
    );
    return widget;
  }
}
