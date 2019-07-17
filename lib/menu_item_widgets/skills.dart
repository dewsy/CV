import 'package:flutter_web/material.dart';

class Skills extends StatelessWidget {
  const Skills({Key key}) : super(key: key);
  static String name = "Skillek";

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: TextStyle(color: Colors.black),
        child: Expanded(
            child: Center(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        _displaySkills("Hard:", [
                          'Java',
                          'SQL',
                          'Flutter/Dart',
                          'Git',
                          'Python',
                          'Web (JS, HTML, CSS)',
                          'Golang',
                          'Spring boot'
                        ]),
                        _displaySkills("Soft:", [
                          'scrum',
                          'gitflow',
                          'presentation',
                          'creative writing',
                          'teamwork',
                          'out-of-the-box thinking'
                        ])
                      ],
                    )))));
  }

  Widget _displaySkills(String title, List<String> skills) {
    return Expanded(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          Center(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.black26,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))),
          Expanded(
            child: ListView(children: _listOfSkills(skills)),
          )
        ]));
  }

  List<Widget> _listOfSkills(List<String> skills) {
    return skills.map((skill) {
      return Container(
        padding: EdgeInsets.all(5),
        child: Card(
            color: Color(0xff38ada9),
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  skill,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )))),
      );
    }).toList();
  }
}
