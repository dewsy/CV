import 'package:cv/model/list_item.dart';
import 'package:flutter_web/material.dart';

class DetailWidget extends StatefulWidget {
  final ListItem data;

  DetailWidget(this.data);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.data.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[widget.data.widget],
        ),
      ),
    );
  }
}
