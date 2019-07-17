import 'package:flutter_web/material.dart';
import 'detail_widget.dart';
import 'package:cv/model/list_item.dart';

class DetailPage extends StatefulWidget {
  final ListItem data;
  DetailPage(this.data);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DetailWidget(widget.data),
    );
  }
}
