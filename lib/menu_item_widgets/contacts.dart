import 'dart:js';

import 'package:cv/model/contact_info.dart';
import 'package:flutter_web/material.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key key}) : super(key: key);
  static String name = "elérhetőségek";

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width < 860 ? 1 : 2;
    return Expanded(
        child: Container(
      padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
      child: _contactsInfo(crossAxisCount),
    ));
  }

  Widget _contactsInfo(int crossAxisCount) {
    return GridView.count(
      crossAxisCount: crossAxisCount,
      childAspectRatio: 4,
      children: <Widget>[
        _contactCard(ContactInfo(
            "dewsyy@gmail.com", "mailto:dewsyy@gmail.com", Icons.email)),
        _contactCard(ContactInfo("Linkedin",
            "https://www.linkedin.com/in/gyula-sipos-b9a783173/", Icons.link)),
        _contactCard(ContactInfo(
            "YouTube",
            "https://www.youtube.com/user/dewsyy/featured?view_as=subscriber",
            Icons.live_tv)),
        _contactCard(
            ContactInfo("+36/30-411-8311", "tel:+36304118311", Icons.phone)),
        _contactCard(ContactInfo(
            "Facebook", "https://www.facebook.com/sgyula", Icons.face)),
        _contactCard(ContactInfo("Messenger",
            "https://www.messenger.com/t/sgyula", Icons.chat_bubble_outline))
      ],
    );
  }

  Widget _contactCard(ContactInfo contactInfo) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Card(
          color: Color(0xff78e08f),
          child: InkWell(
            onTap: () => {
              context.callMethod("open", [contactInfo.link, '_blank'])
            },
            child: Container(
              width: 290,
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Icon(contactInfo.icon)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Text(
                      contactInfo.title,
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
