import 'dart:js';

import 'package:cv/model/repository.dart';
import 'package:flutter_web/material.dart';

class Repositories extends StatelessWidget {
  const Repositories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var repos = _repoList();
    return Expanded(
        child: Container(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
            child: ListView.builder(
              itemCount: repos.length,
              itemBuilder: (context, int index) {
                return _displayRepo(repos[index]);
              },
            )));
  }

  Widget _displayRepo(Repository repo) {
    return Card(
        color: Color(0xffb8e994),
        child: InkWell(
            onTap: () => {
                  context.callMethod("open", [repo.link, '_blank'])
                },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          repo.name,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, letterSpacing: 1.15),
                        )),
                        Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.launch,
                        color: Colors.grey[200],
                      ),
                    ),
                  ]),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(repo.description))
                ],
              ),
            )));
  }

  List<Repository> _repoList() {
    return [
      Repository("Szeretet földje app", "https://github.com/dewsy/SzerfoldAPP",
          """Az első megjelent, teljesen önálló alkalmazásom. Dart-ban íródot (Java-hoz nagyon hasonló szintaxisú, típusos, Objektum Orientált nyelv), a funkciója, hogy egy honlapról scrapel cikkeket, és azokat megjeleníti."""),
      Repository(
          "Szeretet földje REST API",
          "https://github.com/dewsy/SzerfoldAPI",
          """A fenti projekt első változatában még független adatbázist akartam létrehozni a cikkeknek. Ez ahhoz egy REST szerver. Tokenes azonosítással védett, Swagger-generálású kód a nagyja. Adattárolásra PostgresQL-t kötöttem be. A projekt Go-ban íródott. A Go gépkódra fordul, típusos, könnyű benne több szálon dolgozni, a szintaxis Python-szerű (preferált funkcionálisan írni). Ez a Google szerver-oldali választott nyelve."""),
      Repository("Gift to my GF", "https://github.com/dewsy/giftToMyGf",
          """Ez az egyszerű Java program barátnőmnek készült karácsonyi ajándékként. Indításkor összerak és megjelenít egy HTML-dokumentumot a háttérben úszkáló szívecskékkel és a közepén egy kedves üzenettel. A program tudja, mikor nyitották meg legutóbb (ne lehessen csalni), és a fontosabb dátumokkal (szülinap, évforduló, stb) is tisztában van. Ilyen alkalmakkor speciális üzenetet jelenít meg."""),
      Repository(
          "HashMap implementation",
          "https://github.com/dewsy/hashMapImplementation",
          """Ez még egy iskolai feladat volt, egy HashMapet kellett implementálnom generikusokkal, Java-ban. Az elkészült feladat tudja az alapvető funkciókat (új KV párt betenni, meglévőt kiolvasni, illetőleg méretezi magát a Map). A feladat fő szempontja a kód hatékonysága volt.""")
    ];
  }
}
