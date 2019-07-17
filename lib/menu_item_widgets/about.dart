import 'package:flutter_web/material.dart';

class About extends StatelessWidget {
  const About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      initiallyExpanded: root.title == 'Bemutatkozás:' ? true : false,
      key: PageStorageKey<Entry>(root),
      onExpansionChanged: (value) {},
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

String _calculateAge() {
  var birthDate = DateTime(1991, 12, 27);
  Duration difference = DateTime.now().difference(birthDate);
  return (difference.inDays / 365).floor().toString();
}

final List<Entry> data = <Entry>[
  Entry(
    'Bemutatkozás:',
    <Entry>[
      Entry('''Üdv!
  Sipos Gyula vagyok, ${_calculateAge()} éves junior programozó. Amit az alábbi menüpontok nem árulnak el rólam, hogy nyitott, megoldás-központú személyiség vagyok, aki szeret csapatban dolgozni, és a kedvencem, ha problémákat kapok, amikre aztán megoldásokat agyalhatok ki.
  A backenden otthonosabban érzem magam mint fronton, de ennek ellenére ezt a weboldalt is én kalapáltam össze.
'''),
    ],
  ),
  Entry(
    'Iskolák:',
    <Entry>[
      Entry('- Budai Ciszterci Szent Imre Gimnázium - Érettségi: 2010'),
      Entry(
          '- Minerva Gimnázium és Szakközépiskola - Hangtechnikus szakképesítés: 2015'),
      Entry(
          '- Eötvös Loránd Tudományegyetem Tanító és óvóképző kar - diploma: 2016'),
      Entry(
          '- CodeCool kft. programozói tanfolyam 1 éves elméleti képzés: 2019'),
    ],
  ),
  Entry(
    'Munkatapasztalat:',
    <Entry>[
      Entry('- Androbit informatikai magazin - szerző:  10 év'),
      Entry('- Magyar Telekom Nyrt. - Mobiltudós program - mobiltudós: 5 év'),
      Entry(
          '- Magyar Telekom Nyrt. - tech-support Contact Center képviselő: 2 év'),
    ],
  ),
  Entry(
    'Ismert nyelvek:',
    <Entry>[
      Entry('- Angol: Folyékony társalgási szinten vagyok szóban és írásban.'),
      Entry('- Német: Középfokú nyelvvizsgával rendelkezem, de nem használom.'),
    ],
  ),
  Entry(
    'Hobbik:',
    <Entry>[
      Entry('- 8 éve tanulok énekelni.'),
      Entry('- Amatőr szinten színészkedem.'),
      Entry('- Amatőr szinten fotózok.'),
      Entry('- Néha videókat csinálok, ha elkap egy téma.'),
      Entry(
          '- Olvasok, főleg sci-fit és fantasy-t. Kedvenc írók között van Neil Gaiman, Terry Pratchett, John Scalzi, David Gemmell, James S. A. Corey, Iain Banks, Greg Keyes.'),
    ],
  ),
  Entry('Motiváció:', <Entry>[
    Entry(
        'Szeretek új dolgokat alkotni, ötleteket, megközelítéseket kipróbálni, amikkel a világ számomra érdekes / releváns problémáira keresek önazonos megoldásokat.')
  ])
];
