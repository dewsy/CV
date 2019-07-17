import 'package:cv/model/list_item.dart';
import 'package:flutter_web/material.dart';

typedef Null ItemSelectedCallback(ListItem item);

class ListWidget extends StatefulWidget {
  final List<ListItem> listItems;

  final ItemSelectedCallback onItemSelected;
  ListWidget(this.listItems, this.onItemSelected);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    var items = widget.listItems;
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            color: items[index].color,
            child: InkWell(
              onTap: () {
                widget.onItemSelected(items[index]);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Icon(items[index].icon)),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      items[index].name,
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
