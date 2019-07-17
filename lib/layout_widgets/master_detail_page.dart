import 'package:cv/menu_item_widgets/about.dart';
import 'package:cv/menu_item_widgets/contacts.dart';
import 'package:cv/menu_item_widgets/repositories.dart';
import 'package:cv/menu_item_widgets/skills.dart';
import 'package:cv/model/list_item.dart';
import 'package:flutter_web/material.dart';
import 'list_widget.dart';
import 'detail_widget.dart';
import 'detail_page.dart';

class MasterDetailPage extends StatefulWidget {
  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  ListItem selectedValue;
  bool isLargeScreen;

  @override
  Widget build(BuildContext context) {
    isLargeScreen = (MediaQuery.of(context).size.width > 720) ? true : false;
    var menuList = _generateList();
    if (selectedValue == null) {
      selectedValue = menuList[0];
    }
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return Row(
          children: <Widget>[Expanded(child: _displayList(orientation))],
        );
      } else {
        return Row(children: <Widget>[
          isLargeScreen
              ? Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: _displayList(orientation))
              : Expanded(child: _displayList(orientation)),
          isLargeScreen
              ? Expanded(child: DetailWidget(selectedValue))
              : Container(),
        ]);
      }
    });
  }

  Widget _displayList(Orientation orientation) {
    return ListWidget(_generateList(), (value) {
      if (isLargeScreen && orientation == Orientation.landscape) {
        setState(() {
          selectedValue = value;
        });
      } else {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailPage(value);
          },
        ));
      }
      ;
    });
  }

  List<ListItem> _generateList() {
    return [
      ListItem("Bemutatkozás", Icons.description, About(), Color(0xffb8e994)),
      ListItem("Skillek", Icons.dashboard, Skills(), Color(0xff78e08f)),
      ListItem(
          "Repók", Icons.developer_mode, Repositories(), Color(0xff38ada9)),
      ListItem("Elérhetőségek", Icons.contacts, Contacts(), Color(0xff079992)),
    ];
  }
}
