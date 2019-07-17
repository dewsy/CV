import 'package:flutter_web/material.dart';
import 'layout_widgets/master_detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sipos Gyula önéletrajz',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
            appBar: AppBar(
              title: Text('Sipos Gyula - CV'),
              actions: <Widget>[],
            ),
            body: DefaultTextStyle(
                style: TextStyle(color: Colors.black),
                child: MasterDetailPage())),
        Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('profilepic.jpg')))))),
      ],
    );
  }
}
